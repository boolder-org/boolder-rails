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

  task top: :environment do 
    raise "not ready for prod" if Rails.env.production?

    Problem.where(featured: true).update_all(featured: false)

    split = {
      '4a': 3,
      '4b': 3,
      '4c': 3,
      '5a': 5,
      '5b': 5,
      '5c': 5,
      '6a': 10,
      '6b': 10,
      '6c': 10,
      '7a': 15,
      '7b': 10,
      '7c': 10,
      '8a': 3,
      '8b': 2,
      '8c': 1,
      '9a': 1,
    }

    split.each do |grade, count|
      Problem.where(grade: [grade, "#{grade}+"]).order(popularity: :desc).limit(count).each do |problem|
        problem.update(featured: true)
      end
    end

    puts "done".green
  end
end