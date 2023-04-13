require 'rgeo/geo_json'

namespace :mapbox do
  task areas: :environment do
    puts "exporting areas"

    factory = RGeo::GeoJSON::EntityFactory.instance

    area_features = []
    hull_features = []

    Area.published.each do |area|
      hull = area.boulders.where(ignore_for_area_hull: false).
        select("st_buffer(st_convexhull(st_collect(polygon::geometry)),0.00007) as hull").to_a.first.hull

      hash = {}.with_indifferent_access
      hash[:area_id] = area.id
      # we store lat/lon as strings to make it easier to edit the geojson in tools like JOSM
      hash[:south_west_lat] = area.bounds[:south_west].lat.to_s
      hash[:south_west_lon] = area.bounds[:south_west].lon.to_s
      hash[:north_east_lat] = area.bounds[:north_east].lat.to_s
      hash[:north_east_lon] = area.bounds[:north_east].lon.to_s
      hash.deep_transform_keys! { |key| key.camelize(:lower) }
      hull_features << factory.feature(hull, nil, hash)

      hash = {}.with_indifferent_access
      hash[:name] = area.short_name.presence || area.name
      hash[:area_id] = area.id
      hash[:priority] = area.priority
      # we store lat/lon as strings to make it easier to edit the geojson in tools like JOSM
      hash[:south_west_lat] = area.bounds[:south_west].lat.to_s
      hash[:south_west_lon] = area.bounds[:south_west].lon.to_s
      hash[:north_east_lat] = area.bounds[:north_east].lat.to_s
      hash[:north_east_lon] = area.bounds[:north_east].lon.to_s
      hash.deep_transform_keys! { |key| key.camelize(:lower) }
      area_features << factory.feature(hull.centroid, nil, hash)
    end

    feature_collection = factory.feature_collection(
      area_features + hull_features
    )

    geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    file_name = Rails.root.join('export', "mapbox", "areas.geojson")

    File.open(file_name,"w") do |f|
      f.write(geo_json)
    end

    puts "exported areas.geojson".green
  end

  task top7a: :environment do
    puts "exporting problems"

    factory = RGeo::GeoJSON::EntityFactory.instance

    # problems = Problem.joins(:area).where(area: { published: true }).
    #   significant_ascents. 
    #   where(grade: %w(7a 7a+)).
    #   order(popularity: :desc).
    #   limit(100)

    problems = Problem.where(id: [6064,245,10869,230,237,881,1088,7726,915,914,1032,10045,10042,1739,1703,9896,9981,9071,9074,14558,14199,14343,14303,14304,14136,1780,1856,1913,1861,1816,1840,11310,2021,2003,1913,2087,5397,532513672,13612,13711,11321,11776,11773,11737,2668,2857,7813,7807,2542,2543,2720,2527,8680,8801,1455,1579,1526,1435,12222,6008,5978,8325,5091,7878,11643,12998,13011,13074,13042,2893,2911,2902,3161,186,4534,4551,7480,9237,9176,9302,9345,2315,2214,7756,2352,690,3331,3288])

    problem_features = problems.map do |problem|
      hash = {}.with_indifferent_access
      hash.merge!(problem.slice(:grade, :circuit_number, :steepness))
      hash[:id] = problem.id
      hash[:circuit_color] = problem.circuit&.color
      hash[:circuit_id] = problem.circuit&.id

      name_fr = I18n.with_locale(:fr) { problem.name_with_fallback }
      name_en = I18n.with_locale(:en) { problem.name_with_fallback }
      hash[:name] = name_fr
      hash[:name_en] = (name_en != name_fr) ? name_en : ""

      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features
    )

    geo_json = RGeo::GeoJSON.encode(feature_collection)

    File.open(Rails.root.join('export', 'mapbox', "top7a.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported top7a.geojson".green
  end

  task problems: :environment do
    puts "exporting problems"

    raise "please specify a value for include_boulders (true or false). Reminder: don't include boulders when exporting to boolder-data" unless ENV["include_boulders"].present?
    include_boulders = ENV["include_boulders"] == "true"

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.all.joins(:area).where(area: {published: true}).map do |problem|
      hash = {}.with_indifferent_access
      hash.merge!(problem.slice(:grade, :circuit_number, :steepness))
      hash[:id] = problem.id
      hash[:circuit_color] = problem.circuit&.color
      hash[:circuit_id] = problem.circuit&.id

      name_fr = I18n.with_locale(:fr) { problem.name_with_fallback }
      name_en = I18n.with_locale(:en) { problem.name_with_fallback }
      hash[:name] = name_fr
      hash[:name_en] = (name_en != name_fr) ? name_en : ""

      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, nil, hash)
    end

    # Extract boulders alongside problems to ensure we always upload both at the same time to mapbox
    boulder_features = Boulder.all.joins(:area).where(area: {published: true}).map do |boulder|
      factory.feature(boulder.polygon, nil, { })
    end

    if include_boulders
      features = problem_features + boulder_features
    else
      features = problem_features
    end

    feature_collection = factory.feature_collection(
      features
    )

    geo_json = RGeo::GeoJSON.encode(feature_collection)

    File.open(Rails.root.join('export', 'mapbox', "problems#{"-without-boulders" if !include_boulders}.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported problems.geojson".green
  end

  task circuits: :environment do 
    factory = RGeo::GeoJSON::EntityFactory.instance

    circuit_features = Circuit.all.map do |circuit|
      line_string = FACTORY.line_string(circuit.sorted_problems.map(&:location))
      factory.feature(line_string, nil, { id: circuit.id, color: circuit.color })
    end

    feature_collection = factory.feature_collection(
      circuit_features
    )

    geo_json = RGeo::GeoJSON.encode(feature_collection)

    File.open(Rails.root.join('export', 'mapbox', "circuits.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported circuits.geojson".green
  end

  # TODO: Revamp the pois task once we migrate to the new POI data model (split pois and poi routes)

  # task pois: :environment do
  #   puts "exporting pois"

  #   factory = RGeo::GeoJSON::EntityFactory.instance

  #   poi_features = Poi.all.reject{|poi| poi.id.in?([10,26]) }.uniq(&:description).map do |poi|
  #     hash = {}.with_indifferent_access
  #     hash[:type] = "parking"
  #     hash[:name] = poi.description
  #     hash[:short_name] = poi.subtitle
  #     hash[:google_url] = poi.google_url
  #     hash.deep_transform_keys! { |key| key.camelize(:lower) }

  #     factory.feature(poi.location, nil, hash)
  #   end

  #   feature_collection = factory.feature_collection(
  #     poi_features
  #   )

  #   geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

  #   file_name = Rails.root.join('export', "mapbox", "pois.geojson")

  #   raise "file already exists" if File.exist?(file_name)

  #   File.open(file_name,"w") do |f|
  #     f.write(geo_json)
  #   end

  #   puts "exported pois.geojson".green
  # end
end