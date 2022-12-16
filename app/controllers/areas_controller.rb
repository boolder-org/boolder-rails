class AreasController < ApplicationController
  def index
    @areas_with_count = Area.published.map {|area| [area, area.problems.count]}.sort{|a,b| b.second <=> a.second }
  end

  def show
    @area = Area.find_by(slug: params[:slug])

    @circuits = @area.main_circuits
  end

  def problems
    @area = Area.find_by(slug: params[:slug])
    
    @problems = @area.problems.order(popularity: :desc).group_by{|p| p.grade }.sort_by{|grade, _| grade }.reverse
  end
end
