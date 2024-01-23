namespace :popularity do
  task compute: :environment do 
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    problems = if area_id == "all"
      Problem.all
    else
      Problem.where(area_id: area_id)  
    end

    problems.find_each do |problem|
      ascents = problem.bleau_problem&.ascents || 0
      ratings_average = problem.bleau_problem&.ratings_average || 0
      popularity = ascents * (ratings_average*ratings_average)
      problem.update!(ascents: ascents, ratings_average: ratings_average, popularity: popularity)
      puts "Computed popularity for problem ##{problem.id}"
    end
    puts "Done".green
  end

  task featured: :environment do 
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    areas = if area_id == "all"
      Area.all
    else
      Area.where(id: area_id)  
    end

    areas.each do |area|
      area.problems.where(featured: true).update_all(featured: false)

      total = [[area.problems.with_location.count * 10/100, 20].min, 2].max
      max_per_grade = (total.to_f * 0.2).round

      top_problems = []

      Problem::GRADE_VALUES.each do |grade|
        top_problems.concat area.problems.significant_ascents.where(grade: grade).order(popularity: :desc).limit(max_per_grade)
      end

      top_problems.sort_by(&:popularity).reverse.take(total).each do |problem|
        problem.update!(featured: true)
      end

      puts "Computed featured problems for area ##{area.id}"
    end

    puts "Done".green
  end
end