class MapController < ApplicationController
  layout "map"

  def index
    if params[:area_id] && (a = Area.find(params[:area_id]))
      @bounds = { 
        south_west_lat: a.bounds[:south_west].lat,
        south_west_lon: a.bounds[:south_west].lon,
        north_east_lat: a.bounds[:north_east].lat,
        north_east_lon: a.bounds[:north_east].lon,
      }
    end
  end
end
