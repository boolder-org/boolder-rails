require 'rgeo/geo_json'

namespace :map_maker_legacy do
  task export: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts "exporting area #{area_id}"

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.where(area_id: area_id).map do |problem|
      hash = {}.with_indifferent_access
      hash.merge!(problem.slice(:grade, :steepness, :height))
      hash[:name] = problem.name
      hash[:bleau_info_id] = problem.bleau_info_id.to_s
      hash[:parent_id] = problem.parent_id
      hash[:sector_color] = problem.sector&.color
      hash[:sector_id] = problem.sector_id_simplified
      hash[:sector_number] = problem.sector_number_simplified
      
      tags = []
      tags << "sit_start" if problem.sit_start
      hash[:tags] = tags 

      hash[:lines] = problem.lines.published.map{|line| {id: line.id} } if problem.lines.any?
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, "problem_#{problem.id}", hash)
    end

    boulder_features = Boulder.where(area_id: area_id).map do |boulder|
      factory.feature(boulder.polygon, "boulder_#{boulder.id}", { })
    end

    sector_features = Area.find(area_id).sectors.map do |sector|
      problems = sector.problems.exclude_bis.with_location.sort_by(&:enumerable_sector_number)
      line_string = FACTORY.line_string(problems.map(&:location))
      factory.feature(line_string, "sector_#{sector.id}", { color: sector.color })
    end

    readme = "****PLEASE READ ME***** This data belongs to boolder.com. Want to use it in your app? Let's discuss: hello@boolder.com"
    readme_feature = factory.feature("POINT(0 0)", nil, { readme: readme })

    feature_collection = factory.feature_collection(
      [readme_feature] + problem_features + boulder_features + sector_features
    )

    geo_json = RGeo::GeoJSON.encode(feature_collection)

    File.open(Rails.root.join('export', 'app', "area-#{area_id}-data.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported area-#{area_id}-data.geojson"

    # `tokml file.geojson > file.kml`
  end
end