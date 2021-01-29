class ProblemsController < ApplicationController
  def index
    @area = Area.find(params[:area_id])
    @problems = @area.problems.order("grade ASC, id ASC")

    # FIXME: make it DRY
    if params[:level] == "level1"
      @problems = @problems.level1
    elsif params[:level] == "level2"
      @problems = @problems.level2
    elsif params[:level] == "level3"
      @problems = @problems.level3
    elsif params[:level] == "level4"
      @problems = @problems.level4
    elsif params[:level] == "level5"
      @problems = @problems.level5
    elsif params[:level] == "level6"
      @problems = @problems.level6
    elsif params[:level] == "level7"
      @problems = @problems.level7
    elsif params[:level] == "level8"
      @problems = @problems.level8
    else
      params[:level] = "all"
    end

    @page = params[:page].presence || 1
    @problems = @problems.page(@page).per(100)
  end

  def show
  end
end
