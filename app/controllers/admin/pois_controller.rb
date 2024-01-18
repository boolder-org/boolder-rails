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
    set_poi
  end

  def update
    set_poi

    if @poi.update(poi_params)
      flash[:notice] = "Poi updated"
      redirect_to admin_pois_path
    else
      flash[:error] = @poi.errors.full_messages.join('; ')
      render "edit", status: :unprocessable_entity
    end
  end

  private 
  def poi_params
    params.require(:poi).
      permit(:name, :short_name, :poi_type, :google_url)
  end

  def set_poi
    @poi = Poi.find(params[:id])
  end
end
