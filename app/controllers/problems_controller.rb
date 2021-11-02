class ProblemsController < ApplicationController
  def show
    @problem = Problem.find(params[:id])
    @line = @problem.lines.published.first
  end
end
