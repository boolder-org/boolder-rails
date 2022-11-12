require 'csv'

namespace :circuit do

  task stats: :environment do
    file_name = Rails.root.join('export', "circuits.csv")
    CSV.open(file_name, "w") do |csv|

      csv << %w(id color area avg_grade median_grade avg_height median_height avg_landing_score avg_risk_score median_risk_score)

      Circuit.all.each do |c|  
        puts c.id
        csv << [
          c.id,
          c.color,
          c.areas.first&.name,
          c.avg_grade,
          c.median_grade,
          c.avg_height,
          c.median_height,
          c.avg_landing_score,
          c.avg_risk_score,
          c.median_risk_score,
        ]
      end

      puts "exported circuits.csv".green
    end
  end
end