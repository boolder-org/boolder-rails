require "HTTParty"

namespace :popularity do
  task scrap: :environment do 
    raise "not ready for prod" if Rails.env.production?

    Problem.where("bleau_info_id IS NOT NULL").where(ratings_average: nil, ratings: nil, ascents: nil).find_each do |problem|

      html = HTTParty.get("https://bleau.info/c/#{problem.bleau_info_id}.html?locale=en").body
      doc = Nokogiri::HTML(html)

      ratings_text = doc.css(".bdetails .bopins")[0]&.text || ""
      ascents_text = doc.css(".bdetails .bopins")[2]&.text || ""

      ratings_average = ratings_text.match(/([0-9]\.[0-9]) Stars/)&.[](1)
      ratings_number = ratings_text.match(/([0-9]+) total/)&.[](1)
      ascents_number = ascents_text.match(/([0-9]+) total/)&.[](1)

      attributes = { ratings_average: ratings_average, ratings: ratings_number, ascents: ascents_number }
      problem.update(attributes)
      puts "Updated problem ##{problem.id}: #{attributes}"

      sleep 0.3.second
    rescue Exception => e
      puts "Exception for problem ##{problem.id}: #{e}".red
    end
  end

  task compute: :environment do 
    raise "not ready for prod" if Rails.env.production?
    
    Problem.find_each do |problem|
      ascents = problem.ascents || 0
      ratings_average = problem.ratings_average || 0
      popularity = ascents * (ratings_average*ratings_average)
      problem.update(popularity: popularity)
      puts "Computed popularity for problem ##{problem.id}"
    end
    puts "Done".green
  end

  task featured: :environment do 
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