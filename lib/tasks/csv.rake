require 'csv'

namespace :csv do
  
  task export: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    CSV.open("output.csv", "w") do |csv|

      csv << %w(area id name grade circuit number url bleau_url)

      Problem.where(area_id: area_id).map do |p|  
        csv << [
          p.area.name,
          p.id, 
          p.name, 
          p.grade, 
          p.circuit.present? ? p.circuit.color : "",
          p.circuit_number,
          "https://www.boolder.com/fr/fontainebleau/apremont/#{p.id}",
          p.bleau_info_id.present? ? "https://bleau.info/c/#{p.bleau_info_id}.html" : "",
        ]
      end
    end
  end
end