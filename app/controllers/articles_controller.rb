class ArticlesController < ApplicationController
  def choose_area
    # see https://guides.rubyonrails.org/caching_with_rails.html#avoid-caching-instances-of-active-record-objects
    @beginner_areas_ids = Rails.cache.fetch("articles/choose_area/beginner_friendly_areas_ids", expires_in: 12.hours) do
      Area.beginner_friendly.pluck(:id)
    end
  end

  def top_areas_train
    @train_stations = Poi.train_station.all
  end

  def top_areas_dry_fast
    # see https://guides.rubyonrails.org/caching_with_rails.html#avoid-caching-instances-of-active-record-objects
    @areas_ids = Rails.cache.fetch("articles/top_areas_dry_fast_ids", expires_in: 12.hours) do
      Area.published.any_tags(:dry_fast).pluck(:id).shuffle
    end
  end
end
