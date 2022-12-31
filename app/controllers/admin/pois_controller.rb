class Admin::PoisController < Admin::BaseController
  def index
    @pois = Poi.order(:id)
  end

  def new
    @poi = Poi.new
  end

  def create
    poi = Poi.create!(poi_params)

    flash[:notice] = "Poi created"
    redirect_to admin_pois_path
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
      permit(:name, :short_name, :google_url)
  end
end
