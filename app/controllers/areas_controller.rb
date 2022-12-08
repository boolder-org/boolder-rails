class AreasController < ApplicationController
  def index
    @areas = Area.published

    if params[:sort] == "name"
      @areas_with_count = @areas.map {|area| [area, area.problems.count]}
      @areas_with_count = @areas_with_count.sort{|a,b| ActiveSupport::Inflector.transliterate(a.first.name) <=> ActiveSupport::Inflector.transliterate(b.first.name) }
    elsif params[:sort].to_i.in?(1..8)
      @areas_with_count = @areas.map {|area| [area, area.problems.level(params[:sort].to_i).count]}
      @areas_with_count = @areas_with_count.sort{|a,b| b.second <=> a.second }
    else
      @areas_with_count = @areas.map {|area| [area, area.problems.count]}
      @areas_with_count = @areas_with_count.sort{|a,b| b.second <=> a.second }
    end
  end

  def show
    @area = Area.find_by(slug: params[:slug])

    @problems = @area.problems.
      order(popularity: :desc).
      limit(20).
      all.sort_by{|p| p.grade}.reverse
  end
end
