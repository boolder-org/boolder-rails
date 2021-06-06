class ArticlesController < ApplicationController
  before_action :redirect_en

  def choose_area
    @beginner_areas = Area.published.reject{|a| a.id == 7}.
      map{|a| [a, a.problems.where("grade < '4a'").count ]}.
      sort_by(&:second).reverse
  end

  def redirect_en
    redirect_to request.env['PATH_INFO'].sub('/en', '/fr') if I18n.locale == :en
  end
end
