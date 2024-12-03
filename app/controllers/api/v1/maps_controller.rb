class Api::V1::MapsController < ActionController::Base
  include ProblemsHelper

  def show
    area = Area.find(params[:area_id])

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.with_location.where(area_id: area.id).map do |problem|
      hash = {}.with_indifferent_access
      hash[:name] = problem.name_debug
      hash[:problem_id] = problem.id
      hash[:updated_at] = problem.updated_at
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      # simple-style attributes to make the map look nicer on geojson.io
      # https://github.com/mapbox/simplestyle-spec/tree/master/1.1.0
      # Important: keep the key exactly as it it (don't camelize it)
      hash[:"marker-color"] = uicolor(problem.sector&.color, fallback: "#ccc")

      factory.feature(problem.location, nil, hash)
    end

    boulder_features = Boulder.where(area_id: area.id).map do |boulder|
      hash = {}.with_indifferent_access
      hash[:boulder_id] = boulder.id
      hash[:updated_at] = boulder.updated_at
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(boulder.polygon, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features + boulder_features
    )

    json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    respond_to do |format|
      format.geojson do
        if params[:download].present?
          send_data json, filename: "area-#{area.id}-#{area.slug}.geojson", type: 'application/geo+json'
        else
          render json: json
        end 
      end
    end
  end
end
