class AreasController < ApplicationController
  def index
    if params[:dismiss_banner].present?
      cookies[:climbing_bus_launch] = { value: 'dismissed', expires: 1.month.from_now }
    end
    
    @popular_areas = Rails.cache.fetch("areas/index/popular_areas", expires_in: 12.hours) do
      Area.published.any_tags(:popular).all.shuffle
    end

    @areas_with_count = Area.published.sort_by{|a| I18n.transliterate(a.name) }
  end

  def levels
    @beginner_areas = Rails.cache.fetch("areas/levels/beginner_areas", expires_in: 12.hours) do
      Area.beginner_friendly
    end

    @areas_with_count = Area.published.map {|area| [area, area.problems.count]}.sort{|a,b| b.second <=> a.second }
  end

  def show
    @area = Area.find_by!(slug: params[:slug])

    @circuits = @area.main_circuits

    @popular_problems = @area.problems.where(featured: true).order(grade: :desc, popularity: :desc)
  end

  def problems
    @area = Area.find_by(slug: params[:slug])
    
    @problems = @area.problems.order(popularity: :desc).group_by{|p| p.grade }.sort_by{|grade, _| grade }.reverse
  end
end
