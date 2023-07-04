# require "HTTParty"
require 'csv'

namespace :bleau do
  task photo_urls: :environment do
    # area_id = ENV["area_id"]
    # raise "please specify an area_id" unless area_id.present?

    CSV.open("export/bleau_photos.csv", "w") do |csv|

      csv << %w(area id name grade circuit number url bleau_id bleau_url photo)

      Problem.joins(:area).where(area: { published: true }).map do |p|  
        photo = p.lines.first&.topo&.photo

        csv << [
          p.area.name,
          p.id, 
          p.name, 
          p.grade, 
          p.circuit.present? ? p.circuit.color : "",
          [p.circuit_number, p.circuit_letter].join(""),
          "https://www.boolder.com/en/fontainebleau/rocher-fin/#{p.id}",
          p.bleau_info_id,
          p.bleau_info_id.present? ? "https://bleau.info/c/#{p.bleau_info_id}.html" : "",
          photo ? url_for(photo.variant(:medium)) : ""
        ]
      end
    end

    puts "exported bleau_photos.csv".green
  end

  task import: :environment do
    slug = ENV["slug"]
    raise "please specify an slug" unless slug.present?

    html = HTTParty.get("https://bleau.info/#{slug}").body
    doc = Nokogiri::HTML(html)

    bleau_problems = doc.css(".vsr").map do |row|
      a = row.css("a").first
      link = a.attributes["href"].value
      id = link[/([\w-]+).html/,1]

      puts "Created import job for bleau_problem_id=#{id}"
      
      BleauImportProblemJob.perform_later(id)
    end
  end
end
