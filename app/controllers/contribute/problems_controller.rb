class Contribute::ProblemsController < Contribute::BaseController
  def show
    @problem = Problem.find(params[:id])

    @main_contribution_request = @problem.contribution_requests.first # TODO: decide which one to use

    @related_problems = ContributionRequest.
      where(location_estimated: @main_contribution_request.location_estimated).
      map(&:problem).sort_by{|p| p.ascents.to_i }.reverse - [@problem]
  end
end
