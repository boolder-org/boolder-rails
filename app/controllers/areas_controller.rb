class AreasController < ApplicationController
  def index
    @areas = Area.order(:name).published

    @beginner_areas = Area.published.map{|a| [a, a.problems.where("grade < '4a'").count ]}.sort_by(&:second).reverse
    @intermediate_areas = Area.published.map{|a| [a, a.problems.where("grade >= '4a' AND grade < '6a'").count ]}.sort_by(&:second).reverse
    @advanced_areas = Area.published.map{|a| [a, a.problems.where("grade >= '6a'").count ]}.sort_by(&:second).reverse

    @annotations = @areas.map do |area| 
      {
        latitude: area.start_location&.latitude,
        longitude: area.start_location&.longitude,
        color: "#059669",
        title: area.name,
        linkUrl: area_path(area),
        linkText: t("area.index.map.see"),
        glyphText: "",
        clusteringIdentifier: area.start_location.distance(Area.find(2).start_location) < 1_500 ? "trois-pignons" : nil,
      } 
    end
  end

  def show
    @area = Area.find(params[:id])

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
  end

  def map 
    @area = Area.find(params[:id])

    @parkings = @area.pois

    @annotation = {
      latitude: @parkings.first&.location&.latitude,
      longitude: @parkings.first&.location&.longitude,
      color: "#059669",
      title: @area.name,
      glyphText: "",
    } 

    if problem = Area.find(@area.id).problems.where(id: params[:problem]).first
      @center = { 
        latitude: problem.location.latitude, 
        longitude: problem.location.longitude 
      }
    end

    @hide_nav = true
  end
end
