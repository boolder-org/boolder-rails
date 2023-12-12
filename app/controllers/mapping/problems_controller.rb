class Mapping::ProblemsController < ApplicationController
  def show
    @problem = Problem.find(params[:id])
    @contributions = @problem.contributions.pending
  end
end
