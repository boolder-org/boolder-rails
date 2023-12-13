class MapController < ApplicationController
  layout "map"

  def index
    if params[:slug] && (area = Area.find_by(slug: params[:slug]))
      @area = area # FIXME: don't forget to refactor _map_nav when changing this
      @bounds = { 
        south_west_lat: area.bounds[:south_west].lat,
        south_west_lon: area.bounds[:south_west].lon,
        north_east_lat: area.bounds[:north_east].lat,
        north_east_lon: area.bounds[:north_east].lon,
      }.
      with_indifferent_access.deep_transform_keys { |key| key.camelize(:lower) }
    end

    if params[:pid] && (problem = Problem.find(params[:pid]))
      location = if params[:contribute]
        problem.contribution_requests.first&.location_estimated
      else
        problem.location
      end
      
      return unless location.present?
      
      @problem = { 
        id: problem.id, # FIXME: don't forget to refactor _map_nav when changing this
        lat: location.lat,
        lon: location.lon,
        name: I18n.with_locale(:fr) { problem.name_with_fallback },
        name_en: I18n.with_locale(:en) { problem.name_with_fallback },
        grade: problem.grade,
      }.
      with_indifferent_access.deep_transform_keys { |key| key.camelize(:lower) }
    end
  end
end
