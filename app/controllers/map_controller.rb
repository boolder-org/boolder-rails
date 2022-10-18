class MapController < ApplicationController
  layout "map"

  def index
    if params[:area_id] && (area = Area.find(params[:area_id]))
      @bounds = { 
        south_west_lat: area.bounds[:south_west].lat,
        south_west_lon: area.bounds[:south_west].lon,
        north_east_lat: area.bounds[:north_east].lat,
        north_east_lon: area.bounds[:north_east].lon,
      }
    end

    if params[:problem_id] && (problem = Problem.find(params[:problem_id]))
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
