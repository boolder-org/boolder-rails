namespace :bleau do
  task import: :environment do
    Area.published.all do |area|
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
    bleau_problems = BleauProblem.
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
end
