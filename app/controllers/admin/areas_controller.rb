class Admin::AreasController < Admin::BaseController
  def index
    @areas = Area.order(:name)
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    area = Area.find(params[:id])
    area.update!(area_params)

    flash[:notice] = "Area updated"
    redirect_to admin_areas_path
  end

  private 
  def area_params
    params.require(:area).
      permit(:name, :published)
  end
end
