require 'rgeo/geo_json'

namespace :mapbox do
  task areas: :environment do
    puts "exporting areas"

    factory = RGeo::GeoJSON::EntityFactory.instance

    area_features = Area.published.map do |area|
      hash = {}.with_indifferent_access
      hash[:name] = area.name
      hash[:area_id] = area.id
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(area.start_location, nil, hash)
    end

    feature_collection = factory.feature_collection(
      area_features
    )

    geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    file_name = Rails.root.join('export', "mapbox", "areas.geojson")

    raise "file already exists" if File.exist?(file_name)

    File.open(file_name,"w") do |f|
      f.write(geo_json)
    end

    puts "exported areas.geojson".green
  end

  task problems: :environment do

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.all.map do |problem|
      hash = {}.with_indifferent_access
      hash.merge!(problem.slice(:grade, :circuit_number, :steepness, :height))
      hash[:name] = problem.name.presence
      hash[:bleau_info_id] = problem.bleau_info_id
      hash[:parent_id] = problem.parent_id
      hash[:circuit_color] = problem.circuit&.color
      hash[:circuit_id] = problem.circuit&.id
      
      tags = problem.tags.present? ? problem.tags : []
      tags << "risky" if problem.risky # FIXME: decide whether to keep this hack when I revamp the risk level info
      hash[:tags] = tags 

      hash[:lines] = problem.lines.published.map{|line| {id: line.id} } if problem.lines.any?
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, "problem_#{problem.id}", hash)
    end

    boulder_features = Boulder.all.map do |boulder|
      factory.feature(boulder.polygon, "boulder_#{boulder.id}", { })
    end

    # circuit_features = Circuit.where(area_id: area_id).map do |circuit|
    #   line_string = FACTORY.line_string(circuit.sorted_problems.map(&:location))
    #   factory.feature(line_string, "circuit_#{circuit.id}", { color: circuit.color })
    # end

    # poi_features = Poi.where(area_id: area_id).map do |poi|
    #   factory.feature(poi.location, "poi_#{poi.id}", { title: poi.title, subtitle: poi.subtitle, description: poi.description })
    # end

    # poiroute_features = Poi.where(area_id: area_id).map do |poi|
    #   factory.feature(poi.route, "poiroute_#{poi.id}", { }) if poi.route
    # end.compact

    feature_collection = factory.feature_collection(
      problem_features + boulder_features
    )

    geo_json = RGeo::GeoJSON.encode(feature_collection)

    File.open(Rails.root.join('export', 'mapbox', "problems.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported problems.geojson".green
  end
end