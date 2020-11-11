require 'rgeo/geo_json'

namespace :geojson do
  task export: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts "exporting area #{area_id}"

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.where(area_id: area_id).map do |problem|
      hash = {}.with_indifferent_access
      hash.merge!(problem.slice(:grade, :circuit_number, :steepness, :height))
      hash[:name] = problem.name.presence
      hash[:bleau_info_id] = problem.bleau_info_id
      hash[:circuit_color] = problem.circuit&.color
      hash[:tags] = problem.tags if problem.tags.present?
      hash[:lines] = problem.lines.published.map{|line| {id: line.id} } if problem.lines.any?
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, "problem_#{problem.id}", hash)
    end

    boulder_features = Boulder.where(area_id: area_id).map do |boulder|
      factory.feature(boulder.polygon, "boulder_#{boulder.id}", { })
    end

    circuit_features = Circuit.where(area_id: area_id).map do |circuit|
      line_string = FACTORY.line_string(circuit.sorted_problems.map(&:location))
      factory.feature(line_string, "circuit_#{circuit.id}", { color: circuit.color })
    end

    poi_features = Poi.where(area_id: area_id).map do |poi|
      factory.feature(poi.location, "poi_#{poi.id}", { title: poi.title, subtitle: poi.subtitle, description: poi.description })
    end

    poiroute_features = Poi.where(area_id: area_id).map do |poi|
      factory.feature(poi.route, "poiroute_#{poi.id}", { }) if poi.route
    end.compact

    feature_collection = factory.feature_collection(
      problem_features + boulder_features + circuit_features + poi_features + poiroute_features
    )

    geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    File.open(Rails.root.join('export', 'app', "area-#{area_id}", "area-#{area_id}-data.geojson"),"w") do |f|
      f.write(geo_json)
    end

    puts "exported area-#{area_id}-data.geojson"

    # `tokml file.geojson > file.kml`
  end
end