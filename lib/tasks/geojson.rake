require 'rgeo/geo_json'

namespace :geojson do
  task import: :environment do
    file = File.read(Rails.root.join('lib', 'tasks', "rochercanon.geojson"))
    data = RGeo::GeoJSON.decode(file)

    problem_features = data.select{|f| f.geometry.is_a?(RGeo::Cartesian::PointImpl) }
    problem_features = problem_features.sort_by{|p| p["id"]}

    problem_features.each do |feature|
      if feature["circuit"]
        circuit = Circuit.find_or_create_by(color: feature["circuit"])
      else
        circuit = nil
      end

      Problem.create(
        id: feature["id"],
        name: feature["name"],
        grade: feature["grade"],
        location: feature.geometry,
        circuit_number: feature["circuitNumber"],
        circuit: circuit,
        steepness: feature["steepness"],
        height: feature["height"],
        photo_line: feature["photoLine"],
      )
    end

    # boulder_features = data.select{|f| f.geometry.is_a?(RGeo::Cartesian::PolygonImpl) }

    # boulder_features.each do |feature|
    #   Boulder.create(polygon: feature.geometry )
    # end
  end

  task export: :environment do
    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.all.map do |problem|
      hash = problem.slice(:id, :name, :grade, :circuit_number, :steepness, :height, :photo_line)
      hash[:circuit] = problem.circuit.color
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, nil, hash)
    end

    boulder_features = Boulder.all.map do |boulder|
      factory.feature(boulder.polygon, nil, {id: boulder.id})
    end

    circuit_features = Circuit.all.map do |circuit|
      line_string = FACTORY.line_string(circuit.sorted_problems.map(&:location))
      factory.feature(line_string, nil, {circuit: circuit.color})
    end

    feature_collection = factory.feature_collection(problem_features + boulder_features + circuit_features)

    geo_json = RGeo::GeoJSON.encode(feature_collection).to_json

    File.open(Rails.root.join('lib', 'tasks', "export.geojson"),"w") do |f|
      f.write(geo_json)
    end
  end
end
