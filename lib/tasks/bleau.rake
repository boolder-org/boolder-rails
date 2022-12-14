require "HTTParty"

namespace :bleau do
  task stats: :environment do 
    Problem.where("bleau_info_id IS NOT NULL").where(ratings_average: nil, ratings: nil, ascents: nil).find_each do |problem|

      html = HTTParty.get("https://bleau.info/c/#{problem.bleau_info_id}.html?locale=en").body
      doc = Nokogiri::HTML(html)

      ratings_text = doc.css(".bdetails .bopins")[0]&.text || ""
      ascents_text = doc.css(".bdetails .bopins")[2]&.text || ""

      ratings_average = ratings_text.match(/([0-9]\.[0-9]) Stars/)&.[](1)
      ratings_number = ratings_text.match(/([0-9]+) total/)&.[](1)
      ascents_number = ascents_text.match(/([0-9]+) total/)&.[](1)

      attributes = { ratings_average: ratings_average, ratings: ratings_number, ascents: ascents_number }
      problem.update(attributes)
      puts "Updated problem ##{problem.id}: #{attributes}"

      sleep 0.3.second
    rescue Exception => e
      puts "Exception for problem ##{problem.id}: #{e}".red
    end
  end
end