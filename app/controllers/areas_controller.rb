class AreasController < ApplicationController
  def index
    @areas = Area.published

    if params[:sort] == "name"
      @areas_with_count = @areas.map {|area| [area, area.problems.count]}
      @areas_with_count = @areas_with_count.sort{|a,b| ActiveSupport::Inflector.transliterate(a.first.name) <=> ActiveSupport::Inflector.transliterate(b.first.name) }
    elsif params[:sort].to_i.in?(1..8)
      @areas_with_count = @areas.map {|area| [area, area.problems.level(params[:sort].to_i).count]}
      @areas_with_count = @areas_with_count.sort{|a,b| b.second <=> a.second }
    else
      @areas_with_count = @areas.map {|area| [area, area.problems.count]}
      @areas_with_count = @areas_with_count.sort{|a,b| b.second <=> a.second }
    end
  end

  def show
    @area = Area.find_by(slug: params[:slug])

    @parkings = @area.pois

    @annotations = [
      {
        latitude: @area.pois.first&.location&.latitude,
        longitude: @area.pois.first&.location&.longitude,
        color: "#059669",
        title: @area.name,
        glyphText: "",
      } 
    ]

    @center = {}

    if location = @area.pois.first&.location
      @center = { 
        latitude: location.latitude, 
        longitude: location.longitude 
      }
    end

    @circuits = @area.problems.order("grade ASC, id ASC").group_by(&:circuit)
    @circuits = Hash[ @circuits.sort_by { |circuit, _| circuit&.order || 100 } ]
  end
end
