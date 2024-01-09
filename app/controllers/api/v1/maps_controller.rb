class Api::V1::MapsController < ActionController::Base
  def show
    area = Area.find(params[:area_id])

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.with_location.where(area_id: area.id).map do |problem|
      hash = {}.with_indifferent_access
      hash[:name] = problem.name_debug
      hash[:problem_id] = problem.id
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, nil, hash)
    end

    boulder_features = Boulder.where(area_id: area.id).map do |boulder|
      hash = {}.with_indifferent_access
      hash[:boulder_id] = boulder.id
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(boulder.polygon, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features + boulder_features
    )

    render json: JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))
  end
end
