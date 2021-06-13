class AreasController < ApplicationController
  def index
    @areas = Area.published
    @areas = @areas.any_tags(params[:tag]) if params[:tag].present?
    @areas = @areas.sort{|a,b| ActiveSupport::Inflector.transliterate(a.name) <=> ActiveSupport::Inflector.transliterate(b.name) }

    @annotations = @areas.map do |area| 
      {
        latitude: area.start_location&.latitude,
        longitude: area.start_location&.longitude,
        color: "#059669",
        title: area.name,
        linkUrl: area_path(area),
        linkText: t("views.areas.index.map.see"),
        glyphText: "",
        clusteringIdentifier: area.cluster,
      } 
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
  end

  def map 
    @area = Area.find_by(slug: params[:slug])

    @parkings = @area.pois

    @annotation = {
      latitude: @parkings.first&.location&.latitude,
      longitude: @parkings.first&.location&.longitude,
      color: "#059669",
      title: @area.name,
      glyphText: "",
    } 

    if problem = Area.find(@area.id).problems.where(id: params[:problem]).first
      if problem.location.present?
        @center = { 
          latitude: problem.location.latitude, 
          longitude: problem.location.longitude 
        }
      end
    end

    @hide_nav = true
  end
end
