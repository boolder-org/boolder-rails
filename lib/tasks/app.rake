# require 'vips'

# namespace :app do

#   task areas: :environment do
#     Area.order(:id).all.each do |area|
#       puts "Area(
# id: #{(area.id.to_s + ",").ljust(3)} 
# name: \"#{(area.name + "\",").ljust(35)} 
# problemsCount: #{(area.problems.count.to_s + ",").ljust(4)} 
# latitude: #{((area.start_location&.latitude || 0).to_s + ",").ljust(20)} 
# longitude: #{((area.start_location&.longitude || 0).to_s + ",").ljust(20)} 
# published: ),".delete("\n")
#     end
#   end

#   task covers: :environment do
#     Area.order(:id).all.each do |area|
#       output_file = Rails.root.join('export', 'app', "area-covers", "area-cover-#{area.id}.jpg").to_s
#       area.cover.open do |file| 
#         im = Vips::Image.new_from_file file.path.to_s
#         im.thumbnail_image(400).write_to_file output_file
#       end
#     end
#   end
# end