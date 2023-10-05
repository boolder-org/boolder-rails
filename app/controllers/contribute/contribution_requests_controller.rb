class Contribute::ContributionRequestsController < ApplicationController
  def index
    @area = Area.find_by(slug: params[:area_slug])
    
    @todos = ContributionRequest.joins(:problem).
      where(problems: { area_id: @area.id }).
      # where.not(todos: { reason: "line" }).
      order("ascents DESC NULLS LAST")

    @bleau_problems = BleauProblem.
      left_outer_joins(:problem).where(problems: { id: nil }).
      where(bleau_area_id: BleauArea.find_by(slug: "cuvier").id).
      # where.not(ascents: nil).
      order("ascents DESC NULLS LAST")
  end

  def dashboard
    @areas = Area.published.
      map{|a| [a, 1 - a.problems.joins(:contribution_requests).where(contribution_requests: { what: "photo" }).sum(:ascents).to_f / a.problems.sum(:ascents).to_f] }.
      sort_by(&:second)

    # @areas_with_ascents = ContributionRequest.all.joins(:problem).group(:area_id).sum(:ascents).
    #   sort_by(&:second).reverse.
    #   select{|area_id, _| Area.find(area_id).published }
  end
end
