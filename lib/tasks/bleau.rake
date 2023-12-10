namespace :bleau do
    task import: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    area = Area.find(area_id)
    bleau_area = area.bleau_area

    html = HTTParty.get("https://bleau.info/#{bleau_area.slug}").body
    doc = Nokogiri::HTML(html)

    bleau_problems = doc.css(".vsr").map do |row|
      a = row.css("a").first
      link = a.attributes["href"].value
      id = link[/([\w-]+).html/,1]

      puts "Created import job for bleau_problem_id=#{id}"
      
      BleauImportProblemJob.perform_later(id)
    end
  end
  
  task promote: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    area = Area.find(area_id)

    bleau_problems = BleauProblem.
      left_outer_joins(:problem).where(problems: { id: nil }).
      where(bleau_area_id: area.bleau_area_id)

    bleau_problems.each do |bleau_problem|
      puts "Promoting bleau_problem_id=#{bleau_problem.id}"

      problem = Problem.new

      problem.area = bleau_problem.bleau_area.area

      problem.name = bleau_problem.name
      problem.grade = bleau_problem.grade
      problem.bleau_info_id = bleau_problem.id
      problem.steepness = bleau_problem.steepness

      if bleau_problem.sit_start
        problem.tags << "sit_start"
      end

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
