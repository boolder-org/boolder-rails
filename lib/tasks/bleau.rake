namespace :bleau do
  task import: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    areas = if area_id == "all"
      Area.all
    else
      Area.where(id: area_id)
    end

    areas.each do |area|
      bleau_area = area.bleau_area
  
      html = HTTParty.get("https://bleau.info/#{bleau_area.slug}").body
      doc = Nokogiri::HTML(html)
  
      doc.css(".vsr").each do |row|
        a = row.css("a").first
        link = a.attributes["href"].value
        id = link[/([\w-]+).html/,1]
  
        puts "Created import job for bleau_problem_id=#{id}"
        
        BleauImportProblemJob.perform_later(id)
      end
    end
  end
  
  task promote: :environment do
    bleau_problems = BleauProblem.joins(:bleau_area => :area).
      left_outer_joins(:problem).where(problems: { id: nil })

    bleau_problems.each do |bleau_problem|
      puts "Promoting bleau_problem_id=#{bleau_problem.id}"

      problem = Problem.new

      problem.area = bleau_problem.bleau_area.area

      problem.name = bleau_problem.name
      problem.grade = bleau_problem.grade
      problem.bleau_info_id = bleau_problem.id
      problem.steepness = bleau_problem.steepness
      problem.sit_start = bleau_problem.sit_start

      # TODO: circuit
      # TODO: created_at

      problem.ratings = bleau_problem.ratings
      problem.ratings_average = bleau_problem.ratings_average
      problem.ascents = bleau_problem.ascents
      
      # TODO : compute popularity

      problem.save!
    end

    puts "done".green
  end

  task update_names: :environment do
    Problem.joins(:bleau_problem).where("problems.name IS DISTINCT FROM bleau_problems.name").each do |problem|
      puts "updating name for problem ##{problem.id}"
      problem.update!(name: problem.bleau_problem.name)
    end
    puts "done".green
  end

  task update_grades: :environment do
    Problem.joins(:bleau_problem).where("problems.grade IS DISTINCT FROM bleau_problems.grade").each do |problem|
      puts "updating grade for problem ##{problem.id}"
      problem.update!(grade: problem.bleau_problem.grade)
    end
    puts "done".green
  end

  task update_sit_starts: :environment do
    Problem.joins(:bleau_problem).where("problems.sit_start IS DISTINCT FROM bleau_problems.sit_start").reject{|p| p.sit_start && p.name&.include?("assis)") }.each do |problem|
      puts "updating sit_start for problem ##{problem.id}"
      problem.update!(sit_start: problem.bleau_problem.sit_start)
    end
    puts "done".green
  end
end
