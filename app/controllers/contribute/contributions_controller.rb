class Contribute::ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new

    @problem = Problem.find(params[:problem_id])
  end
end
