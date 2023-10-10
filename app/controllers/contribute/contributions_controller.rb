class Contribute::ContributionsController < ApplicationController
  def show
    @contribution = Contribution.find(params[:id])
  end

  def new
    @contribution = Contribution.new

    @problem = Problem.find(params[:problem_id])
  end

  def create
    contribution = Contribution.create!(contribution_params)
    # flash[:notice] = "Contribution created!"
    redirect_to [:contribute, contribution]
  end

  private
   def contribution_params
     params.require(:contribution).permit(:location, :comment, photos: [])
   end
end
