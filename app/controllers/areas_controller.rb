class AreasController < ApplicationController
  def index
  	@areas = Area.all
  end

  def show
  	@area = Area.find(params[:id])
  end
end
