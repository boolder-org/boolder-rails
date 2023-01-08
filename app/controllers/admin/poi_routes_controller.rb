class Admin::PoiRoutesController < Admin::BaseController
  def index
    @poi_routes = PoiRoute.order(:id)
  end

  def new
    @poi_route = PoiRoute.new(area_id: params[:area_id])
  end

  def create
    poi_route = PoiRoute.create!(poi_route_params)

    flash[:notice] = "Poi route created"
    redirect_to edit_admin_poi_route_path(poi_route)
  end

  def edit
    @poi_route = PoiRoute.find(params[:id])
  end

  def update
    poi_route = PoiRoute.find(params[:id])
    poi_route.update!(poi_route_params)

    flash[:notice] = "Poi route updated"
    redirect_to edit_admin_poi_route_path(poi_route)
  end

  private 
  def poi_route_params
    params.require(:poi_route).
      permit(:distance, :transport, :area_id, :poi_id)
  end
end
