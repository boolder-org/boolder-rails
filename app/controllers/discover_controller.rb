class DiscoverController < ApplicationController
  def index
    @popular_areas = Area.published.any_tags(:popular).all.sort_by{|a| -a.problems.count }

    @problems = Problem.joins(:area).where(area: { published: true }).where("rating > 50").where(grade: ["6a", "6a+"]).order(grade: :desc)

    @grouped = @problems.group_by{|p| p.area }.sort_by{|k,v| -v.count }
  end
end
