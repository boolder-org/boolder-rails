class Admin::TasksController < Admin::BaseController
  def index
    @area = Area.find_by(slug: params[:area_slug])
    @tabs = %w(missing_line missing_line_coordinates empty_bleau_info_id)

    if !params[:tab].present?
      redirect_to admin_area_tasks_path(tab: @tabs.first) 
    end

    if params[:tab] == "missing_line"
      @problems = @area.problems.joins("LEFT JOIN lines ON lines.problem_id = problems.id").
        where("lines.problem_id IS NULL").uniq
    elsif params[:tab] == "missing_line_coordinates"
      @problems = @area.problems.joins("LEFT JOIN lines ON lines.problem_id = problems.id").
        where("lines.coordinates IS NULL AND lines.problem_id IS NOT NULL").uniq
    elsif params[:tab] == "empty_bleau_info_id"
      @problems = @area.problems.where("bleau_info_id IS NULL OR bleau_info_id = ''")
    end
  end

  def dashboard
    @areas = Area.order(:name)
  end
end
