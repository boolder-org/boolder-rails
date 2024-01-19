class Api::V1::ToposController < ActionController::Base
  def show
    topo = Topo.find(params[:id])

    result = {
      url: url_for_topo(topo)
    }

    render json: JSON.pretty_generate(result)
  end

  def index
    area = Area.find(params[:area_id])

    results = Topo.published.joins(:problems).where(problems: {area_id: area.id }).uniq.map do |topo|
      { 
        topo_id: topo.id,
        url: url_for_topo(topo),
      }
    end
    
    render json: JSON.pretty_generate(results)
  end

  private
  def url_for_topo(topo) 
    cdn_image_url(topo.photo.variant(:medium))
  end
end
