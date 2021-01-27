class ProblemsController < ApplicationController
  def index
  	@area = Area.find(params[:area_id])
  	@problems = @area.problems.joins(:circuit).where(circuits: { color: params[:color].presence || "blue" })
  end

  def show
  end
end
