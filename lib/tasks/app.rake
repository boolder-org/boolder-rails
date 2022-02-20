namespace :app do

  task areas: :environment do
    Area.order(:id).all.each do |area|
      puts "Area(
id: #{(area.id.to_s + ",").ljust(3)} 
name: \"#{(area.name + "\",").ljust(25)} 
problemsCount: #{(area.problems.count.to_s + ",").ljust(4)} 
latitude: #{((area.start_location&.latitude || 0).to_s + ",").ljust(20)} 
longitude: #{((area.start_location&.longitude || 0).to_s + ",").ljust(20)} 
published: ),".delete("\n")
    end
  end
end