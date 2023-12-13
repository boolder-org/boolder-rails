class Mapping::ProblemsController < ApplicationController
  def show
    @problem = Problem.find(params[:id])
    @contributions = @problem.contributions.pending
  end

  def index
    @area = Area.find(params[:area_id])

    @problems = @area.problems.where(location: nil).
      left_joins(:contribution_requests).where(contribution_requests: { id: nil }).
      order(grade: :desc)
  end
end
