class AreasController < ApplicationController
  def index
    @areas = Area.published

    if params[:sort] == "all"
      @areas_with_count = @areas.map {|area| [area, area.problems.count]}
      @areas_with_count = @areas_with_count.sort{|a,b| b.second <=> a.second }
    elsif params[:sort].to_i.in?(1..8)
      @areas_with_count = @areas.map {|area| [area, area.problems.level(params[:sort].to_i).count]}
      @areas_with_count = @areas_with_count.sort{|a,b| b.second <=> a.second }
    else
      @areas_with_count = @areas.map {|area| [area, area.problems.count]}
      @areas_with_count = @areas_with_count.sort{|a,b| ActiveSupport::Inflector.transliterate(a.first.name) <=> ActiveSupport::Inflector.transliterate(b.first.name) }
    end

    @beginner_areas = Rails.cache.fetch("areas/index/beginner_friendly_list", expires_in: 12.hours) do
      Area.any_tags(:beginner_friendly).all.shuffle
    end

    @dry_fast_areas = Rails.cache.fetch("areas/index/dry_fast_list", expires_in: 12.hours) do
      Area.any_tags(:dry_fast).all.shuffle
    end

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

    @circuits = @area.problems.order("grade ASC, id ASC").group_by &:circuit
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
