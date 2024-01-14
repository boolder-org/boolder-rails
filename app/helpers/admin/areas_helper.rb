module Admin::AreasHelper
  def geojson_io_url(area)
    "http://geojson.io/#data=data:text/x-url," + URI.encode_www_form_component(geojson_source_url(area))
  end

  def geojson_source_url(area, download: false)
    # host: "www.boolder.com", port: nil, protocol: "https",
    api_v1_area_area_map_url(area_id: area.id, download: download)
  end
end
