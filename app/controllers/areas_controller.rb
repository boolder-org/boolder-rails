class AreasController < ApplicationController
  def index
    @areas = Area.published

    # @areas_with_count = @areas.map {|area| [area, area.problems.count]}
    @areas = @areas.sort{|a,b| ActiveSupport::Inflector.transliterate(a.name) <=> ActiveSupport::Inflector.transliterate(b.name) }

    @beginner_areas = Area.published.any_tags(:beginner_friendly).all

    @intermediate_areas = 
      Area.published.
        reject{|a| a.id.in?([64, 69, 42]) }. # FIXME: use a tag to avoid tricky areas
        select{|a| a.problems.where("grade < '6a' AND grade >= '4a'").count >= 100 }

    @advanced_areas = 
      Area.published.
        reject{|a| a.id.in?([42]) }. # FIXME: use a tag to avoid *very* tricky areas (like Dame Jouanne (id=42))
        select{|a| a.problems.where("grade >= '6a'").count >= 100 }
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
