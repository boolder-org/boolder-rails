require 'rgeo/geo_json'

namespace :geojson do
  task export: :environment do
    area_id = 1

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.all.map do |problem|
      hash = {type: 'problem', id: problem.id}.with_indifferent_access
      hash.merge!(problem.slice(:name, :grade, :circuit_number, :steepness, :height))
      hash[:circuit] = problem.circuit.color
      hash[:topos] = problem.topos.map{|t| {id: t.id} } if problem.topos.any?
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, nil, hash)
    end

    boulder_features = Boulder.all.map do |boulder|
      factory.feature(boulder.polygon, nil, {type: 'boulder', id: boulder.id})
    end

    circuit_features = Circuit.all.map do |circuit|
      line_string = FACTORY.line_string(circuit.sorted_problems.map(&:location))
      factory.feature(line_string, nil, {circuit: circuit.color})
    end

    feature_collection = factory.feature_collection(problem_features + boulder_features + circuit_features)

    geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    File.open(Rails.root.join('export', "area-#{area_id}", "area-#{area_id}-data.geojson"),"w") do |f|
      f.write(geo_json)
    end

    # `tokml file.geojson > file.kml`
  end
end
