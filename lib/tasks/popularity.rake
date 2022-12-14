namespace :popularity do
  task compute: :environment do 
    Problem.find_each do |problem|
      ascents = problem.ascents || 0
      ratings_average = problem.ratings_average || 0
      popularity = ascents * (ratings_average*ratings_average)
      problem.update(popularity: popularity)
      puts "Computed popularity for problem ##{problem.id}"
    end
    puts "Done".green
  end

  task top: :environment do 
    raise "not ready for prod" if Rails.env.production?

    Problem.where(featured: true).update_all(featured: false)

    Area.all.each do |area|
      total = [[area.problems.count * 10/100, 20].min, 2].max
      max_per_grade = (total.to_f * 0.2).round

      top_problems = []

      Problem::GRADE_VALUES.each do |grade|
        top_problems.concat area.problems.significant_ascents.where(grade: grade).order(popularity: :desc).limit(max_per_grade)
      end

      top_problems.sort_by(&:popularity).reverse.take(total).each do |problem|
        problem.update(featured: true)
      end
    end

    puts "done".green
  end
end