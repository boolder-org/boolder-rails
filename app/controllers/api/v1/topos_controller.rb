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
  def url_for_topo(topo, options = {}) 
    options = options.merge(host: Rails.application.config.asset_host) unless Rails.env.local?
    topo_proxy_url(topo, options)
  end
end
