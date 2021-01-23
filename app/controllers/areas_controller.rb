class AreasController < ApplicationController
  def index
  	@areas = Area.all
  end

  def show
  	@area = Area.find(params[:id])
  	@problems = @area.problems.where("grade < '4a'").order("grade ASC")
  end
end
