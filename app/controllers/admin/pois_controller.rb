class Admin::PoisController < Admin::BaseController
  def index
    @pois = Poi.order(:id)
  end

  def edit
    @poi = Poi.find(params[:id])
  end

  def update
    poi = Poi.find(params[:id])
    poi.update!(poi_params)

    flash[:notice] = "Poi updated"
    redirect_to admin_pois_path
  end

  private 
  def poi_params
    params.require(:poi).
      permit(:area_id, :title, :subtitle, :description, :location, :route, :walk_time, :google_url)
  end
end
