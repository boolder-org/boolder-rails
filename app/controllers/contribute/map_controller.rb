class Contribute::MapController < Contribute::BaseController
  layout "map"

  # TODO: make DRY
  def index
    if params[:slug] && (area = Area.find_by(slug: params[:slug]))
      @area = area
      @bounds = { 
        south_west_lat: area.bounds[:south_west].lat,
        south_west_lon: area.bounds[:south_west].lon,
        north_east_lat: area.bounds[:north_east].lat,
        north_east_lon: area.bounds[:north_east].lon,
      }.
      with_indifferent_access.deep_transform_keys { |key| key.camelize(:lower) }
    end

    if params[:pid] && (problem = Problem.find(params[:pid]))
      # return unless problem.location.present?
      location = problem.contribution_requests.first&.location_estimated
      
      @problem = { 
        id: problem.id,
        lat: location&.lat,
        lon: location&.lon,
        name: I18n.with_locale(:fr) { problem.name_with_fallback },
        name_en: I18n.with_locale(:en) { problem.name_with_fallback },
        grade: problem.grade,
      }.
      with_indifferent_access.deep_transform_keys { |key| key.camelize(:lower) }
    end
  end

  def geojson
    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = ContributionRequest.where.not(location_estimated: nil).group_by(&:location_estimated).map do |location, requests|
      problems = requests.map(&:problem)
      problem = problems.sort_by{|p| p.ascents.to_i }.reverse.first

      hash = {}.with_indifferent_access

      hash.merge!(problem.slice(:grade, :steepness, :featured, :popularity))
      hash[:id] = problem.id
      # hash[:circuit_color] = problem.circuit&.color
      # hash[:circuit_id] = problem.circuit_id_simplified
      # hash[:circuit_number] = problem.circuit_number_simplified.presence

      group_name = if problems.count > 1 
        "#{problem.name_debug} + #{problems.count - 1}"
      else
        problem.name_debug
      end

      name_fr = I18n.with_locale(:fr) { group_name }
      name_en = I18n.with_locale(:en) { group_name }
      hash[:name] = name_fr
      hash[:name_en] = (name_en != name_fr) ? name_en : ""

      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(location, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features
    )

    render json: JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))
  end
end
