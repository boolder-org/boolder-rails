class BleauImportProblemJob < ApplicationJob
  queue_as :default

  def perform(id)
    bleau_problem = BleauProblem.find_or_create_by(id: id)

    html = HTTParty.get("https://bleau.info/c/#{id}.html?locale=en").body
    doc = Nokogiri::HTML(html)

    name = doc.css("h3")[0].text.split("\n").second.strip
    grade = doc.css("h3 em")[0].text.split("\n").second.strip

    tags = doc.css(".btype").first.text.strip
    sit_start = tags.include?("sitstart")

    circuit = doc.css('.bcircuit a').select { |link| link['href'].include?(".html") }.first
    circuit_number_and_letter = circuit&.text&.split(":")&.second&.strip
    circuit_number, circuit_letter_full = circuit_number_and_letter&.split(" ")
    circuit_letter = Problem::LETTERS.invert[circuit_letter_full]
    bleau_circuit_id = if circuit
      circuit.attributes["href"].value.match(/\d+/)[0]
    end

    ratings_text = doc.css(".bdetails .bopins")[0]&.text || ""
    ascents_text = doc.css(".bdetails .bopins")[2]&.text || ""

    ratings_average = ratings_text.match(/([0-9]\.[0-9]) Stars/)&.[](1)
    ratings_number = ratings_text.match(/([0-9]+) total/)&.[](1)
    ascents_number = ascents_text.match(/([0-9]+) total/)&.[](1)

    slug = doc.css("h3 a")[0].attributes["href"].value.gsub("/", "")

    # TODO: move to attributes
    bleau_problem.bleau_area = BleauArea.find_by(slug: slug)

    attributes = { 
      name: name,
      grade: grade,
      sit_start: sit_start,
      bleau_circuit_id: bleau_circuit_id,
      circuit_number: circuit_number,
      circuit_letter: circuit_letter,
      ratings_average: ratings_average, 
      ratings: ratings_number, 
      ascents: ascents_number 
    }

    # binding.pry
    
    bleau_problem.update!(attributes)

    Rails.logger.debug "Updated bleau_problem ##{id}"
  end
end