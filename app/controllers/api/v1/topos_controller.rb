class Api::V1::ToposController < ActionController::Base
  def show
    topo = Topo.find(params[:id])

    result = {
      url: url_for(topo.photo.variant(:medium))
    }

    render json: result
  end
end
