require "HTTParty"

namespace :bleau do
  
  task sync: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    area = Area.find area_id

    html = HTTParty.get("https://bleau.info/cuvier").body
    doc = Nokogiri::HTML(html)

    problems = doc.css(".vsr a").map do |row|
      link = row.attributes["href"].value
      id = link[/([\w-]+).html/,1]
      OpenStruct.new(id: id, name: row.text)
    end

    missing = problems.select do |bleau_problem|
      area.problems.where(bleau_info_id: bleau_problem.id).none?
    end

    missing_variants = missing.select do |p|
      regex = /(.+)([\(].+[\)])/
      if canonical_name = p.name[regex,1]
        area.problems.where(name: canonical_name.strip).any?
      else
        false
      end
    end


    binding.pry
  end
end