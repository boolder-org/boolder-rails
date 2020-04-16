require 'rgeo/geo_json'

namespace :geojson do
  task import: :environment do
    file = File.read(Rails.root.join('lib', 'tasks', "rochercanon.geojson"))
    data = RGeo::GeoJSON.decode(file)

    problem_features = data.select{|f| f.geometry.is_a?(RGeo::Cartesian::PointImpl) }
    problem_features = problem_features.sort_by{|p| p["id"]}

    problem_features.each do |feature|
      Problem.create(id: feature["id"], name: feature["name"], grade: feature["grade"], location: feature.geometry )
    end
  end

  task export: :environment do
    factory = RGeo::GeoJSON::EntityFactory.instance

    features = Problem.all.map do |problem|
      factory.feature(problem.location, nil, {id: problem.id, name: problem.name, grade: problem.grade})
    end

    feature_collection = factory.feature_collection(features)

    puts RGeo::GeoJSON.encode(feature_collection).to_json
  end
end
