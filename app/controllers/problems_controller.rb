class ProblemsController < ApplicationController
  def index
    @area = Area.find(params[:area_id])
    @problems = @area.problems.order("grade ASC, id ASC")

    if params[:level].to_i.in?(1..8)
      @problems = @problems.level(params[:level].to_i)
    else
      params[:level] = "all"
    end

    @page = params[:page].presence || 1
    @problems = @problems.page(@page).per(100)
  end

  def show
  end
end
