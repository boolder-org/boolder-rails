class Contribute::ProblemsController < Contribute::BaseController
  def show
    @problem = Problem.find(params[:id])
    @contributions = @problem.contributions.pending
  end
end
