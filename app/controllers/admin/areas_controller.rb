class Admin::AreasController < Admin::BaseController
  def index
    @areas = Area.order(:name)
  end
end
