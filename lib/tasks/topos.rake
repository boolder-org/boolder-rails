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
  	# topo.photo.open{|file| FileUtils.cp(file.path, Rails.root.join('_import', 'test.jpg'))}
  end
end