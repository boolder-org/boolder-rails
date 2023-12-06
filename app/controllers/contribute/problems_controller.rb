class Contribute::ProblemsController < Contribute::BaseController
  def show
    @problem = Problem.find(params[:id])

    @main_contribution_request = @problem.contribution_requests.first # TODO: decide which one to use
  end
end
