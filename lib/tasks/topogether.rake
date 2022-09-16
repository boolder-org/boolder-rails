require 'csv'
include Imgix::Rails::UrlHelper

namespace :topogether do

  task topos: :environment do
    topos = Topo.published.all
    output = topos.map{|topo| { id: topo.id, photo: topo.photo ? ix_image_url(topo.photo.key) : ""} }

    File.open(Rails.root.join('export', 'topogether', "topos.json"),"w") do |f|
      f.write(JSON.pretty_generate(output))
    end
  end
  
  task areas: :environment do
    areas = Area.published.order(:id).all
    output = areas.map{|area| { id: area.id, name: area.name, photo: area.cover ? ix_image_url(area.cover.key) : "" } }

    File.open(Rails.root.join('export', 'topogether', "areas.json"),"w") do |f|
      f.write(JSON.pretty_generate(output))
    end
  end
end