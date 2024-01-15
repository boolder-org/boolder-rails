module Admin::AreasHelper
  def geojson_io_url(area)
    "http://geojson.io/#data=data:text/x-url," + URI.encode_www_form_component(geojson_source_url(area, prod_url: true))
  end

  def geojson_source_url(area, download: false, prod_url: false)
    args = { download: download.presence }
    args.merge!(host: "www.boolder.com", port: nil, protocol: "https") if prod_url

    api_v1_area_area_map_url(area_id: area.id, format: :geojson, **args)
  end
end
