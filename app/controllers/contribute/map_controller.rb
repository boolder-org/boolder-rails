class Contribute::MapController < Contribute::BaseController
  layout "map"

  def index
  end

  def geojson
    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = ContributionRequest.where.not(location_estimated: nil).map do |request|
      problem = request.problem

      hash = {}.with_indifferent_access

      # hash.merge!(problem.slice(:grade, :steepness, :featured, :popularity))
      # hash[:id] = problem.id
      # hash[:circuit_color] = problem.circuit&.color
      # hash[:circuit_id] = problem.circuit_id_simplified
      # hash[:circuit_number] = problem.circuit_number_simplified.presence

      name_fr = I18n.with_locale(:fr) { problem.name_with_fallback }
      name_en = I18n.with_locale(:en) { problem.name_with_fallback }
      hash[:name] = name_fr
      hash[:name_en] = (name_en != name_fr) ? name_en : ""

      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(request.location_estimated, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features
    )

    render json: JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))
  end
end
