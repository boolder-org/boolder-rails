class Api::V1::ToposController < ActionController::Base
  def show
    topo = Topo.find(params[:id])

    result = {
      url: url_for(topo.photo.variant(resize_to_limit: [1200, 1200], quality: 50))
    }

    render json: result
  end
end
