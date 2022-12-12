class ArticlesController < ApplicationController
  def choose_area
    @beginner_areas = Rails.cache.fetch("shared/beginner_friendly_list", expires_in: 12.hours) do
      Area.published.any_tags(:beginner_friendly).all.shuffle
    end
  end

  def top_areas_beginner
    @beginner_areas = Rails.cache.fetch("shared/beginner_friendly_list", expires_in: 12.hours) do
      Area.published.any_tags(:beginner_friendly).all.shuffle
    end
  end

  def top_areas_groups
    @areas = Area.published.
      reject{|a| a.id.in?([64, 69, 42]) }. # FIXME: use a tag to avoid tricky areas
      select{|a| a.level_density_score >= 5}
  end

  def top_areas_train
  end

  def top_areas_dry_fast
    @areas = Rails.cache.fetch("articles/top_areas_dry_fast", expires_in: 12.hours) do
      Area.published.
        any_tags(:dry_fast).
        shuffle
    end
  end
end
