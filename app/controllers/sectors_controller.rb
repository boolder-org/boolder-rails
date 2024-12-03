class SectorsController < ApplicationController
  def index
    @sectors = Sector.all.sort_by(&:average_grade)
  end

  def show
    @sector = Sector.find(params[:id])
    @area = @sector.main_area
  end
end
