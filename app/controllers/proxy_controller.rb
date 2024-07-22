# more info: https://github.com/rails/rails/tree/main/activestorage/app/controllers/active_storage
class ProxyController < ActiveStorage::BaseController
  include ActiveStorage::Streaming
  include ActiveStorage::DisableSession

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def show
    topo = Topo.find(params[:id])
    representation = topo.photo.variant(:medium)

    http_cache_forever public: true do
      send_blob_stream representation, disposition: params[:disposition]
    end
  end

  private
  def not_found
    head :not_found
  end
end