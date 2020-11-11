require 'rgeo/geo_json'

namespace :josm do
  task export: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts "exporting area #{area_id}"

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.where(area_id: area_id).map do |problem|
      hash = {}.with_indifferent_access
      hash[:name] = [problem.circuit&.color, problem.circuit_number, problem.name.presence].join(" ")
      hash[:problem_id] = problem.id
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, nil, hash)
    end

    boulder_features = Boulder.where(area_id: area_id).map do |boulder|
      hash = {}.with_indifferent_access
      hash[:boulder_id] = boulder.id
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(boulder.polygon, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features + boulder_features
    )

    geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    File.open(Rails.root.join('export', "josm", "area-#{area_id}", "area-#{area_id}-data.geojson"),"w") do |f|
      f.write(geo_json)
    end

    puts "exported area-#{area_id}-data.geojson"
  end

  task metadata: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts "exporting metadata for area #{area_id}"

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.where(area_id: area_id).map do |problem|
      hash = {}.with_indifferent_access
      hash[:name] = [problem.circuit&.color, problem.circuit_number, problem.name.presence].join(" ")
      hash[:problem_id] = problem.id
      hash[:positioning_error] = problem.topos.first&.location_positioning_error_from_metadata&.to_f&.round(1)
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.topos.first&.location_from_metadata, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features
    )

    geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    File.open(Rails.root.join('export', "josm", "area-#{area_id}", "area-#{area_id}-metadata.geojson"),"w") do |f|
      f.write(geo_json)
    end

    puts "exported area-#{area_id}-metadata.geojson"
  end
end