require 'vips'

namespace :topos do

  task export: :environment do
  	area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    with_photos = (ENV["with_photos"] == "true")
    puts "skipping photos" if !with_photos

    lines = []

  	Line.published.joins(:problem).where(problems: { area_id: area_id }).each do |line|
      hash = { id: line.id, topo_id: line.topo_id, coordinates: line.coordinates }.with_indifferent_access
      hash.deep_transform_keys! { |key| key.camelize(:lower) }
  		lines << hash

      if with_photos
        puts "processing photo for line ##{line.id}"
        output_file = Rails.root.join('export', "area-#{area_id}", "topos", "topo-#{line.topo.id}.jpg").to_s
        
        # FIXME: iterate on topos (not lines) to avoid double processing
    		line.topo.photo.open do |file| 
          im = Vips::Image.new_from_file file.path.to_s
          im.thumbnail_image(800).write_to_file output_file
        end
      end
  	end

  	File.open(Rails.root.join('export', "area-#{area_id}", "area-#{area_id}-topo-lines.json"),"w") do |f|
  		output = { lines: lines }
      f.write(JSON.pretty_generate(output))
    end

    puts "exported area-#{area_id}-topo-lines.json"
  end
end