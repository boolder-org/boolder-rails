class ArticlesController < ApplicationController
  def choose_area
    @beginner_areas = Rails.cache.fetch("articles/choose_area/beginner_friendly_areas", expires_in: 12.hours) do
      Area.published.any_tags(:beginner_friendly).all.shuffle
    end
  end

  def top_areas_train
    @train_stations = Poi.train_station.all
  end

  def top_areas_dry_fast
    @areas = Rails.cache.fetch("articles/top_areas_dry_fast", expires_in: 12.hours) do
      Area.published.
        any_tags(:dry_fast).
        shuffle
    end
  end
end
