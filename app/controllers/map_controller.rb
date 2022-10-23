class MapController < ApplicationController
  layout "map"

  def index
    if params[:slug] && (area = Area.find_by(slug: params[:slug]))
      @area = area
      @bounds = { 
        south_west_lat: area.bounds[:south_west].lat,
        south_west_lon: area.bounds[:south_west].lon,
        north_east_lat: area.bounds[:north_east].lat,
        north_east_lon: area.bounds[:north_east].lon,
      }
    end

    if params[:pid] && (problem = Problem.find(params[:pid]))
      @problem = { 
        id: problem.id,
        lat: problem.location.lat,
        lon: problem.location.lon,
        name: problem.name,
        grade: problem.grade,
      }
    end
  end
end
