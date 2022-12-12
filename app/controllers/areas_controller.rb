class AreasController < ApplicationController
  def index
    @areas = Area.published

    @areas_with_count = @areas.map {|area| [area, area.problems.count]}
    @areas_with_count = @areas_with_count.sort{|a,b| b.second <=> a.second }
  end

  def show
    @area = Area.find_by(slug: params[:slug])

    @grades = @area.problems.order(popularity: :desc).group_by{|p| p.grade }.sort_by{|grade, _| grade }.reverse
  end
end
