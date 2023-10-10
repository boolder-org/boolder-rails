class Contribute::ContributionRequestsController < ApplicationController
  MIN_ASCENTS = 5

  def index
    @area = Area.find(params[:area_id])
    
    @requests = ContributionRequest.joins(:problem).
      where(problems: { area_id: @area.id }).
      where(what: "photo").
      where("ascents >= ?", MIN_ASCENTS).
      order("ascents DESC NULLS LAST")

    @requests_rest = ContributionRequest.joins(:problem).
      where(problems: { area_id: @area.id }).
      where(what: "photo").
      where("ascents < ?", MIN_ASCENTS).
      order("ascents DESC NULLS LAST")
  end

  def dashboard
    @areas = Area.published.
      map{|a| [
          a, 
          a.problems.joins(:contribution_requests).where(contribution_requests: { what: "photo" }).where("ascents >= ?", MIN_ASCENTS).count,
          1 - a.problems.joins(:contribution_requests).where(contribution_requests: { what: "photo" }).sum(:ascents).to_f / a.problems.sum(:ascents).to_f
        ]
      }.
      sort_by(&:second).reverse
  end
end
