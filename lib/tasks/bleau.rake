require 'selenium-webdriver'
require 'csv'

namespace :bleau do
  task ratings: :environment do 
    options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    driver = Selenium::WebDriver.for(:chrome, options: options)

    driver.get('https://bleau.info/advanced-search')

    min_grade = '6a'
    max_grade = '6a+'
    min_ascents = "200"

    element = driver.find_element(id: 'search_min_ascents')
    element.send_keys(min_ascents)

    element = driver.find_element(id: 'search_min_grade')
    element.send_keys(min_grade)

    element = driver.find_element(id: 'search_max_grade')
    element.send_keys(max_grade)

    element.submit

    results = driver.find_element(id: 'the_search_results')

    # binding.pry

    CSV.open("export/ratings-#{min_grade}-#{max_grade}.csv", "w") do |csv|

      csv << %w(id name bleau_info_id rating)

      results.find_elements(:class, "vsr").each do |result|
        rating = result.attribute("data-rating")
        bleau_info_id = result.find_elements(tag_name: "a").first&.attribute("id")

        if problem = Problem.find_by(bleau_info_id: bleau_info_id)
          puts [problem.id, problem.name, bleau_info_id, rating].join(", ")  
          csv << [problem.id, problem.name, bleau_info_id, rating]
        else
          puts "problem with bleau_info_id=#{bleau_info_id} doesn't exist".red
        end
      end
    end

    driver.quit
  end
end