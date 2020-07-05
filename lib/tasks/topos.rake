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
  		  topo = problem.topos.first_or_create
    		topo.photo.attach(io: File.open(Rails.root.join('lib', 'tasks', '_import', filename)), filename: 'photo.jpg')
        topo.save!

        puts "created topo ##{topo.id}"
      # end
		end
  end

  task export: :environment do
  	area_id = 1
  	topos = []

  	Topo.joins(:problem).where(problems: { area_id: area_id }).each do |topo|
  		topos << { id: topo.id, line: topo.line }
  		topo.photo.open{|file| FileUtils.cp(file.path, Rails.root.join('export', "area-#{area_id}", "topos", "topo-#{topo.id}.jpg"))}
  	end

  	File.open(Rails.root.join('export', "area-#{area_id}", "area-#{area_id}-topos.json"),"w") do |f|
  		output = { topos: topos }
      f.write(JSON.pretty_generate(output))
    end
  end
end