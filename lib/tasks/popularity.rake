namespace :popularity do
  task compute: :environment do 
    Problem.find_each do |problem|
      ascents = problem.ascents || 0
      ratings_avg = problem.ratings_avg || 0
      popularity = ascents * (ratings_avg*ratings_avg)
      problem.update(popularity: popularity)
      puts "Computed popularity for problem ##{problem.id}"
    end
    puts "Done".green
  end
end