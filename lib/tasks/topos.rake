require 'vips'

namespace :topos do
  
  task import: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

  	Dir.foreach(Rails.root.join('lib', 'tasks', '_import')) do |filename|
		  next if filename == '.' or filename == '..' or filename == '.DS_Store'

      puts "processing #{filename}"
		  
		  problem_name = File.basename(filename, '.jpeg')
      color, number = problem_name.split("-")

      puts "#{color} #{number}"

		  problem = Problem.joins(:circuit).
        where(area_id: area_id).
        where(circuits: { color: color }, circuit_number: number).first!

      puts "found problem ##{problem.id}"

      # if problem.topos.any?
      #   puts "skipping (topo already exists for problem #{problem.id})"
      #   next
      # else
        raise "WIP"
  		  topo = problem.topos.first_or_create
    		topo.photo.attach(io: File.open(Rails.root.join('lib', 'tasks', '_import', filename)), filename: 'photo.jpg')
        topo.save!

        puts "created topo ##{topo.id}"
      # end
		end
  end

  task export: :environment do
  	area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    topos = []

  	Topo.joins(:problem).where(problems: { area_id: area_id }).each do |topo|
  		topos << { id: topo.id, line: topo.line }
      output_file = Rails.root.join('export', "area-#{area_id}", "topos", "topo-#{topo.id}.jpg").to_s
      
  		topo.photo.open do |file| 
        im = Vips::Image.new_from_file file.path.to_s
        im.thumbnail_image(800).write_to_file output_file
      end
  	end

  	File.open(Rails.root.join('export', "area-#{area_id}", "area-#{area_id}-topos.json"),"w") do |f|
  		output = { topos: topos }
      f.write(JSON.pretty_generate(output))
    end
  end
end