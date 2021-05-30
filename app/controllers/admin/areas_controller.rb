class Admin::AreasController < Admin::BaseController
  def index
    @areas = Area.order(:name)
  end

  def edit
    @area = Area.find(params[:id])
  end

  def show
    @area = Area.find(params[:id])
    redirect_to admin_area_problems_path(@area, circuit_id: 'first')
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
      permit(:name, :slug, :published, :cluster)
  end
end
