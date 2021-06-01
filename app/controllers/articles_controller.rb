class ArticlesController < ApplicationController
  def choose_area
    @beginner_areas = Area.published.reject{|a| a.id == 7}.
      map{|a| [a, a.problems.where("grade < '4a'").count ]}.
      sort_by(&:second).reverse
  end

  def choose_problems
  end
end
