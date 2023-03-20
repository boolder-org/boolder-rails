require 'csv'
include Imgix::Rails::UrlHelper

namespace :todos do
  task bleau_info: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?
    slug = ENV["slug"]
    raise "please specify a slug" unless slug.present?

    area = Area.find area_id

    html = HTTParty.get("https://bleau.info/#{slug}").body
    doc = Nokogiri::HTML(html)

    bleau_problems = doc.css(".vsr").map do |row|
      a = row.css("a").first
      link = a.attributes["href"].value
      id = link[/([\w-]+).html/,1]
      grade = row.children.map { |e| e.text if e.text? }.join.strip
      OpenStruct.new(bleau_info_id: id, name: a.text, grade: grade)
    end

    missing = bleau_problems.select do |bleau_problem|
      Problem.where(bleau_info_id: bleau_problem.bleau_info_id).none?
    end

    missing = missing.map do |bleau_problem|
      OpenStruct.new(bleau_info_id: bleau_problem.bleau_info_id, name: bleau_problem.name, grade: bleau_problem.grade, ascents: ascents(bleau_problem.bleau_info_id))
    end

    # missing_variants = missing.select do |p|
    #   regex = /(.+)([\(].+[\)])/
    #   if canonical_name = p.name[regex,1]
    #     area.problems.where(name: canonical_name.strip).any?
    #   else
    #     false
    #   end
    # end

    missing.sort_by(&:ascents).reverse.each do |p|
      puts [
        p.name,
        p.grade,
        "https://bleau.info/#{slug}/#{p.bleau_info_id}.html",
        p.ascents,
      ].join(",")
    end

    # binding.pry
  end

  task missing_photo: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?
    slug = ENV["slug"]
    raise "please specify a slug" unless slug.present?

    area = Area.find area_id

    problems = area.problems.where("bleau_info_id IS NOT NULL AND bleau_info_id <>''").
      joins("LEFT JOIN lines ON lines.problem_id = problems.id").
      where("lines.problem_id IS NULL").
      uniq

    problems.sort_by{|p| p.ascents.to_i }.reverse.each do |p|
      puts [
        p.name_debug,
        p.grade,
        "https://www.boolder.com/fr/fontainebleau/#{area.slug}/#{p.id}",
        "https://bleau.info/#{slug}/#{p.bleau_info_id}.html",
        p.ascents.to_i
      ].join(",")
    end

    puts "Done".green
  end

  task missing_line: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?
    slug = ENV["slug"]
    raise "please specify a slug" unless slug.present?

    area = Area.find area_id

    problems = area.problems.where("bleau_info_id IS NOT NULL AND bleau_info_id <>''").
      select{|p| p.lines.published.select{|l| l.coordinates.nil? }.any?}

    problems.sort_by{|p| p.ascents.to_i }.reverse.each do |p|

      puts [
        p.name_debug,
        p.grade,
        "https://www.boolder.com/fr/fontainebleau/#{area.slug}/#{p.id}",
        "https://bleau.info/#{slug}/#{p.bleau_info_id}.html",
        p.ascents.to_i
      ].join(",")
    end

    puts "Done".green
  end
end

def ascents(bleau_info_id)
  puts "getting ascents for bleau_info_id #{bleau_info_id}"
  html = HTTParty.get("https://bleau.info/c/#{bleau_info_id}.html?locale=en").body
  doc = Nokogiri::HTML(html)

  # ratings_text = doc.css(".bdetails .bopins")[0]&.text || ""
  ascents_text = doc.css(".bdetails .bopins")[2]&.text || ""

  # ratings_average = ratings_text.match(/([0-9]\.[0-9]) Stars/)&.[](1)
  # ratings_number = ratings_text.match(/([0-9]+) total/)&.[](1)
  ascents_number = ascents_text.match(/([0-9]+) total/)&.[](1)

  ascents_number.to_i
end