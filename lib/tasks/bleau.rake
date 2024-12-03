require 'csv'

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
    # TODO: make this code DRY with bleau_problems_controller.rb
    bleau_problems = BleauProblem.joins(:bleau_area => :area).
      left_outer_joins(:problem).where(problems: { id: nil })

    bleau_problems.uniq.each do |bleau_problem|
      puts "Promoting bleau_problem_id=#{bleau_problem.id}"

      problem = Problem.new

      problem.area = bleau_problem.bleau_area.area

      problem.name = bleau_problem.name
      problem.grade = bleau_problem.grade
      problem.bleau_info_id = bleau_problem.id
      problem.steepness = bleau_problem.steepness
      problem.sit_start = bleau_problem.sit_start

      # TODO: sector
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
    # TODO: make this code DRY with bleau_problems_controller.rb
    Problem.joins(:bleau_problem).where("problems.name IS DISTINCT FROM bleau_problems.name").each do |problem|
      puts "updating name for problem ##{problem.id}"
      problem.update!(name: problem.bleau_problem.name)
    end
    puts "done".green
  end

  task update_grades: :environment do
    # TODO: make this code DRY with bleau_problems_controller.rb
    Problem.joins(:bleau_problem).where("problems.grade IS DISTINCT FROM bleau_problems.grade").each do |problem|
      puts "updating grade for problem ##{problem.id}"
      problem.update!(grade: problem.bleau_problem.grade)
    end
    puts "done".green
  end

  task update_sit_starts: :environment do
    # TODO: make this code DRY with bleau_problems_controller.rb
    Problem.joins(:bleau_problem).where("problems.sit_start IS DISTINCT FROM bleau_problems.sit_start").reject{|p| p.sit_start && p.name&.include?("assis)") }.each do |problem|
      puts "updating sit_start for problem ##{problem.id}"
      problem.update!(sit_start: problem.bleau_problem.sit_start)
    end
    puts "done".green
  end

  task areas: :environment do
    html = HTTParty.get("https://bleau.info/areas_by_region?locale=en").body
    doc = Nokogiri::HTML(html)

    areas = doc.css(".area_by_regions a").select{|a| a.attributes["data-method"].nil? }

    data = areas.map{|a| [a.attributes["href"].value.sub(/^\/+/, ""), a.text.strip.split(/\s*\(/)[0].strip, a.css('span').text&.strip&.tr('()', '').presence] }
    
    missing = data.select{|slug, name, category| BleauArea.find_by(slug: slug).nil? }
    raise "missing areas" if missing.any?
    
    data.each{|slug, name, category| BleauArea.find_by(slug: slug)&.update!(name: name, category: category) }
  end

  task csv_areas: :environment do
    bleau_areas = BleauArea.all

    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["slug", "name", "category", "problems", "ascents", "mapped"]

      bleau_areas.each do |b|
        csv << [b.slug, b.name, b.category, b.bleau_problems.count, b.bleau_problems.sum(:ascents), b.area&.published]
      end
    end

    File.write("bleau_areas.csv", csv_data)

    puts "Data exported to bleau_areas.csv"
  end

  task csv_problems: :environment do
    bleau_problems = BleauProblem.left_outer_joins(:problem).where(problems: { id: nil }).where("bleau_problems.ascents > 0").order(ascents: :desc)

    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["area", "name", "grade", "ascents"]

      bleau_problems.each do |bp|
        csv << [bp.bleau_area.name, bp.name, bp.grade, bp.ascents]
      end
    end

    File.write("bleau_problems.csv", csv_data)

    puts "Data exported to bleau_problems.csv"
  end
end
