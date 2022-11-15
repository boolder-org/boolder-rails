class Api::V1::ToposController < ActionController::Base
  include Imgix::Rails::UrlHelper

  def show
    topo = Topo.find(params[:id])
    redirect_to ix_image_url(topo.photo.key, w: 800, ar:'4:3', fit: 'crop')
  end
end
