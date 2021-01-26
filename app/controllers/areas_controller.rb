class AreasController < ApplicationController
  def index
  	@areas = Area.all
  end

  def show
  	@area = Area.find(params[:id])
  	# @problems = @area.problems.where("grade < '4a'").order("grade ASC")
  	@problems = @area.problems.order(Arel.sql('RANDOM()')).take(3)
  end
end
