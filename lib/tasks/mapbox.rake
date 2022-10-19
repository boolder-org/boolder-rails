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
    puts "exporting problems"

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.all.joins(:area).where(area: {published: true}).map do |problem|
      hash = {}.with_indifferent_access
      hash.merge!(problem.slice(:grade, :circuit_number, :steepness))
      hash[:id] = problem.id
      hash[:name] = problem.name.presence
      hash[:bleau_info_id] = problem.bleau_info_id
      hash[:parent_id] = problem.parent_id
      hash[:circuit_color] = problem.circuit&.color
      hash[:circuit_id] = problem.circuit&.id

      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, "problem_#{problem.id}", hash)
    end

    boulder_features = Boulder.all.joins(:area).where(area: {published: true}).map do |boulder|
      factory.feature(boulder.polygon, "boulder_#{boulder.id}", { })
    end

    feature_collection = factory.feature_collection(
      problem_features + boulder_features
    )

    geo_json = RGeo::GeoJSON.encode(feature_collection)

    File.open(Rails.root.join('export', 'mapbox', "problems.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported problems.geojson".green
  end

  task boulders: :environment do
    puts "exporting boulders"

    factory = RGeo::GeoJSON::EntityFactory.instance

    boulder_features = Boulder.all.joins(:area).where(area: {published: true}).map do |boulder|
      factory.feature(boulder.polygon, "boulder_#{boulder.id}", { })
    end

    feature_collection = factory.feature_collection(
      boulder_features
    )

    geo_json = RGeo::GeoJSON.encode(feature_collection)

    File.open(Rails.root.join('export', 'mapbox', "boulders.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported boulders.geojson".green
  end

  task pois: :environment do
    puts "exporting pois"

    factory = RGeo::GeoJSON::EntityFactory.instance

    poi_features = Poi.all.reject{|poi| poi.id.in?([10,26]) }.uniq(&:description).map do |poi|
      hash = {}.with_indifferent_access
      hash[:type] = "parking"
      hash[:name] = poi.description
      hash[:short_name] = poi.subtitle
      hash[:google_url] = poi.google_url
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(poi.location, nil, hash)
    end

    feature_collection = factory.feature_collection(
      poi_features
    )

    geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    file_name = Rails.root.join('export', "mapbox", "pois.geojson")

    raise "file already exists" if File.exist?(file_name)

    File.open(file_name,"w") do |f|
      f.write(geo_json)
    end

    puts "exported pois.geojson".green
  end
end