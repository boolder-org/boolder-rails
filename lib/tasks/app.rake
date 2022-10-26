# require 'vips'
require 'rgeo/geo_json'

namespace :app do
  task geojson: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts "exporting area #{area_id}"

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.where(area_id: area_id).map do |problem|
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

    boulder_features = Boulder.where(area_id: area_id).map do |boulder|
      factory.feature(boulder.polygon, "boulder_#{boulder.id}", { })
    end

    circuit_features = Circuit.area(area_id).map do |circuit|
      line_string = FACTORY.line_string(circuit.sorted_problems.map(&:location))
      factory.feature(line_string, "circuit_#{circuit.id}", { color: circuit.color })
    end

    poi_features = Poi.where(area_id: area_id).map do |poi|
      factory.feature(poi.location, "poi_#{poi.id}", { title: poi.title, subtitle: poi.subtitle, description: poi.description })
    end

    poiroute_features = Poi.where(area_id: area_id).map do |poi|
      factory.feature(poi.route, "poiroute_#{poi.id}", { }) if poi.route
    end.compact

    readme = "****PLEASE READ ME***** This data belongs to boolder.com. Want to use it in your app? Let's discuss: hello@boolder.com"
    readme_feature = factory.feature("POINT(0 0)", nil, { readme: readme })

    feature_collection = factory.feature_collection(
      [readme_feature] + problem_features + boulder_features + circuit_features + poi_features + poiroute_features
    )

    geo_json = RGeo::GeoJSON.encode(feature_collection)

    File.open(Rails.root.join('export', 'app', "area-#{area_id}", "area-#{area_id}-data.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported area-#{area_id}-data.geojson".green

    # `tokml file.geojson > file.kml`
  end

  task topos: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts "exporting area #{area_id}"

    with_photos = (ENV["with_photos"] == "true")
    puts "skipping photos" if !with_photos

    lines = []

    Line.published.joins(:problem).where(problems: { area_id: area_id }).each do |line|
      hash = { id: line.id, topo_id: line.topo_id, coordinates: line.coordinates }.with_indifferent_access
      hash.deep_transform_keys! { |key| key.camelize(:lower) }
      lines << hash

      if with_photos
        puts "processing photo for line ##{line.id}"
        output_file = Rails.root.join('export', 'app', "area-#{area_id}", "topos", "topo-#{line.topo.id}.jpg").to_s

        if File.exist?(output_file)
          puts "topo-#{line.topo.id}.jpg already exists"
        else
          # FIXME: iterate on topos (not lines) to avoid double processing
          line.topo.photo.open do |file| 
            im = Vips::Image.new_from_file file.path.to_s
            im.thumbnail_image(800).write_to_file output_file
          end
        end
      end
    end

    File.open(Rails.root.join('export', 'app', "area-#{area_id}", "area-#{area_id}-topo-lines.json"),"w") do |f|
      output = { lines: lines }
      f.write(JSON.pretty_generate(output))
    end

    puts "exported area-#{area_id}-topo-lines.json".green
  end

  task areas: :environment do
    Area.order(:id).all.each do |area|
      puts "Area(
id: #{(area.id.to_s + ",").ljust(3)} 
name: \"#{(area.name + "\",").ljust(35)} 
problemsCount: #{(area.problems.count.to_s + ",").ljust(4)} 
latitude: #{((area.start_location&.latitude || 0).to_s + ",").ljust(20)} 
longitude: #{((area.start_location&.longitude || 0).to_s + ",").ljust(20)} 
published: ),".delete("\n")
    end
  end

  # task covers: :environment do
  #   Area.order(:id).all.each do |area|
  #     puts "processing area ##{area.id}"

  #     output_file = Rails.root.join('export', 'app', "area-covers", "area-cover-#{area.id}.jpg").to_s
  #     area.cover.open do |file| 
  #       im = Vips::Image.new_from_file file.path.to_s
  #       im.thumbnail_image(400).write_to_file output_file
  #     end
  #   end

  #   puts "exported covers".green
  # end
end