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
      hash[:name] = area.short_name || area.name
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

    file_name = Rails.root.join("..", "boolder-maps", "mapbox", "areas.geojson")

    File.open(file_name,"w") do |f|
      f.write(geo_json)
    end

    puts "exported areas.geojson".green
  end

  task clusters: :environment do
    puts "exporting clusters"

    factory = RGeo::GeoJSON::EntityFactory.instance

    cluster_features = []
    hull_features = []

    Cluster.all.each do |cluster|
      hull = Boulder.where(area_id: cluster.areas.map(&:id)).where(ignore_for_area_hull: false).
        select("st_buffer(st_convexhull(st_collect(polygon::geometry)),0.00007) as hull").to_a.first.hull

      hash = {}.with_indifferent_access
      hash[:cluster_id] = cluster.id
      hash[:name] = cluster.name

      hash.deep_transform_keys! { |key| key.camelize(:lower) }
      hull_features << factory.feature(hull, nil, hash)

      if cluster.sw && cluster.ne && cluster.center
        hash = {}.with_indifferent_access
        hash[:cluster_id] = cluster.id
        hash[:name] = cluster.name
        hash[:south_west_lat] = cluster.sw.lat.to_s
        hash[:south_west_lon] = cluster.sw.lon.to_s
        hash[:north_east_lat] = cluster.ne.lat.to_s
        hash[:north_east_lon] = cluster.ne.lon.to_s

        hash.deep_transform_keys! { |key| key.camelize(:lower) }
        cluster_features << factory.feature(cluster.center, nil, hash)
      end
    end

    feature_collection = factory.feature_collection(
      cluster_features + hull_features
    )

    geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    file_name = Rails.root.join("..", "boolder-maps", "mapbox", "clusters.geojson")

    File.open(file_name,"w") do |f|
      f.write(geo_json)
    end

    puts "exported clusters.geojson".green
  end

  task problems: :environment do
    puts "exporting problems"

    raise "please specify a value for include_boulders (true or false). Reminder: don't include boulders when exporting to boolder-data" unless ENV["include_boulders"].present?
    include_boulders = ENV["include_boulders"] == "true"

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.with_location.joins(:area).where(area: {published: true}).map do |problem|
      hash = {}.with_indifferent_access
      hash.merge!(problem.slice(:grade, :steepness, :featured, :popularity))
      hash[:id] = problem.id
      hash[:sector_color] = problem.sector&.color
      hash[:sector_id] = problem.sector_id_simplified
      hash[:sector_number] = problem.sector_number_simplified

      name_fr = I18n.with_locale(:fr) { problem.name_with_fallback }
      name_en = I18n.with_locale(:en) { problem.name_with_fallback }
      hash[:name] = name_fr
      hash[:name_en] = (name_en != name_fr) ? name_en : ""

      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, nil, hash)
    end

    # Extract boulders alongside problems to ensure we always upload both at the same time to mapbox
    boulder_features = Boulder.where.not(area_id: [45,75,79, 104]).joins(:area).where(area: {published: true}).map do |boulder|
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

    File.open(Rails.root.join("..", "boolder-maps", "mapbox", "problems#{"-without-boulders" if !include_boulders}.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported problems.geojson".green
  end

  task sectors: :environment do 
    factory = RGeo::GeoJSON::EntityFactory.instance

    sector_features = Sector.all.map do |sector|
      problems = sector.problems.exclude_bis.with_location.sort_by(&:enumerable_sector_number)
      line_string = FACTORY.line_string(problems.map(&:location))
      factory.feature(line_string, nil, { id: sector.id, color: sector.color })
    end

    feature_collection = factory.feature_collection(
      sector_features
    )

    geo_json = RGeo::GeoJSON.encode(feature_collection)

    File.open(Rails.root.join("..", "boolder-maps", "mapbox", "sectors.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported sectors.geojson".green
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

  #   file_name = Rails.root.join("..", "boolder-maps", "mapbox", "pois.geojson")

  #   raise "file already exists" if File.exist?(file_name)

  #   File.open(file_name,"w") do |f|
  #     f.write(geo_json)
  #   end

  #   puts "exported pois.geojson".green
  # end
end