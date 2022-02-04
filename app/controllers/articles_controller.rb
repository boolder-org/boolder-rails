class ArticlesController < ApplicationController
  before_action :redirect_en

  def choose_area
    # TODO: update
    @beginner_areas = Area.published.reject{|a| a.id == 7}.
      map{|a| [a, a.problems.where("grade < '4a'").count ]}.
      sort_by(&:second).reverse
  end

  def top_areas_per_level
    # FIXME: use different key?
    @beginner_areas = Rails.cache.fetch("welcome/index/beginner_friendly_list", expires_in: 12.hours) do
      Area.published.any_tags(:beginner_friendly).all.shuffle
    end

    @intermediate_areas = Rails.cache.fetch("articles/top_areas_per_level/intermediate", expires_in: 12.hours) do
      Area.published.
        select{|a| a.problems.where("grade < '6a' AND grade >= '4a'").count >= 100 }.
        shuffle
    end

    @advanced_areas = Rails.cache.fetch("articles/top_areas_per_level/advanced", expires_in: 12.hours) do
      Area.published.
        select{|a| a.problems.where("grade >= '6a'").count >= 100 }.
        shuffle
    end
  end

  def top_areas_train
    @annotations = Area.published.any_tags(:train_station_closeby).map do |area| 
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

  def top_areas_dry_fast
    @areas = Rails.cache.fetch("articles/top_areas_dry_fast", expires_in: 12.hours) do
      Area.published.
        any_tags(:dry_fast).
        shuffle
    end
  end

  def redirect_en
    redirect_to request.env['PATH_INFO'].sub('/en', '/fr') if I18n.locale == :en
  end
end
