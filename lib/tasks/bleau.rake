require 'selenium-webdriver'
require 'csv'

namespace :bleau do
  task stats: :environment do 
    options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    driver = Selenium::WebDriver.for(:chrome, options: options)

    Problem.where("bleau_info_id IS NOT NULL").where("id > 718").where(ratings_avg: nil, ratings: nil, ascents: nil).find_each do |problem|

      driver.get("https://bleau.info/c/#{problem.bleau_info_id}.html")

      ratings_text = driver.find_elements(class: "bopins").first&.text || ""
      ascents_text = driver.find_elements(class: "bopins").third&.text || ""

      ratings_avg = ratings_text.match(/([0-9]\.[0-9]) Stars/)&.[](1)
      ratings_number = ratings_text.match(/([0-9]+) total/)&.[](1)
      ascents_number = ascents_text.match(/([0-9]+) total/)&.[](1)

      attributes = { ratings_avg: ratings_avg, ratings: ratings_number, ascents: ascents_number }
      problem.update(attributes)
      puts "Updated problem ##{problem.id}: #{attributes}"

      sleep 1.second
    rescue Exception => e
      puts "Exception for problem ##{problem.id}: #{e}".red
    end

    driver.quit
  end
end