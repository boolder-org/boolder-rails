class Contribute::ProblemsController < Contribute::BaseController
  def show
    @problem = Problem.find(params[:id])
  end
end
