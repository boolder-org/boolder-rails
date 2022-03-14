class ArticlesController < ApplicationController
  def choose_area
    @beginner_areas = Rails.cache.fetch("shared/beginner_friendly_list", expires_in: 12.hours) do
      Area.published.any_tags(:beginner_friendly).all.shuffle
    end
  end

  def top_areas_level
    @beginner_areas = Rails.cache.fetch("shared/beginner_friendly_list", expires_in: 12.hours) do
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
end
