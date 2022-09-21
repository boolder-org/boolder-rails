# require "HTTParty"
require 'csv'
include Imgix::Rails::UrlHelper

namespace :bleau do
  task photo_urls: :environment do
    # area_id = ENV["area_id"]
    # raise "please specify an area_id" unless area_id.present?

    CSV.open("output.csv", "w") do |csv|

      csv << %w(area id name grade circuit number url bleau_id bleau_url photo)

      Problem.joins(:area).where(area: { published: true }).map do |p|  
        photo = p.lines.first&.topo&.photo

        csv << [
          p.area.name,
          p.id, 
          p.name, 
          p.grade, 
          p.circuit.present? ? p.circuit.color : "",
          p.circuit_number,
          "https://www.boolder.com/en/fontainebleau/rocher-fin/#{p.id}",
          p.bleau_info_id,
          p.bleau_info_id.present? ? "https://bleau.info/c/#{p.bleau_info_id}.html" : "",
          photo ? ix_image_url(photo.key) : ""
        ]
      end
    end
  end

#   task sync: :environment do
#     area_id = ENV["area_id"]
#     raise "please specify an area_id" unless area_id.present?

#     area = Area.find area_id

#     html = HTTParty.get("https://bleau.info/cuvier").body
#     doc = Nokogiri::HTML(html)

#     problems = doc.css(".vsr a").map do |row|
#       link = row.attributes["href"].value
#       id = link[/([\w-]+).html/,1]
#       OpenStruct.new(id: id, name: row.text)
#     end

#     missing = problems.select do |bleau_problem|
#       area.problems.where(bleau_info_id: bleau_problem.id).none?
#     end

#     missing_variants = missing.select do |p|
#       regex = /(.+)([\(].+[\)])/
#       if canonical_name = p.name[regex,1]
#         area.problems.where(name: canonical_name.strip).any?
#       else
#         false
#       end
#     end


#     binding.pry
#   end
end