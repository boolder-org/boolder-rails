require 'rgeo/geo_json'

namespace :geojson do
  desc "TODO"
  task import: :environment do
    file = File.read(Rails.root.join('lib', 'tasks', "rochercanon.geojson"))
    data = RGeo::GeoJSON.decode(file)

    puts data.size
    # binding.pry
  end

end
