class Admin::RedirectsController < Admin::BaseController
  def new
    if problem_id = params[:problem_id]
      redirect_to admin_problem_path(id: problem_id)
    elsif area_id = params[:area_id]
      area = Area.find area_id
      redirect_to admin_area_problems_path(area, sector_id: "first")
    else
      redirect_to admin_areas_path
    end
  end
end
