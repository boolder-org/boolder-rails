class Mapping::ProblemsController < ApplicationController
  def show
    @problem = Problem.find(params[:id])
    @contributions = @problem.contributions.pending
  end

  def index
    @area = Area.find(params[:area_id])
    
    @locations = ContributionRequest.open.joins(:problem).
      where(problems: { area_id: @area.id }).
      where(what: "photo").
      order("ascents DESC NULLS LAST").
      group_by(&:location_estimated).
      sort_by{|location, requests| requests.inject(0) {|sum, req| sum + req.problem.ascents.to_i } }.reverse

    @problems = @area.problems.where(location: nil).without_contribution_request.order(grade: :desc)

    @tab = params[:tab] == "rest" ? :rest : :prio
  end
end
