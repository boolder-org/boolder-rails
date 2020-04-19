namespace :topos do
  
  task import: :environment do
  	Dir.foreach(Rails.root.join('_import')) do |filename|
		  next if filename == '.' or filename == '..' or filename == '.DS_Store'
		  
		  problem_id = File.basename(filename, '.jpg').to_i
		  problem = Problem.find(problem_id)

		  topo = problem.topos.first_or_create
  		topo.photo.attach(io: File.open(Rails.root.join('_import', filename)), filename: 'photo.jpg')
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