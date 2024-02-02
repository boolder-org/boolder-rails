class Mapping::ContributionRequestsController < ApplicationController
  def index
    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = ContributionRequest.open.where.not(location_estimated: nil).group_by(&:location_estimated).map do |location, requests|
      problems = requests.map(&:problem).sort_by{|p| p.ascents.to_i }.reverse
      problem = problems.first

      hash = {}.with_indifferent_access

      hash.merge!(problem.slice(:steepness, :featured, :popularity))

      group_name = problems.count > 1 ? "#{problem.name_debug} + #{problems.count - 1}" : problem.name_debug

      name_fr = I18n.with_locale(:fr) { group_name }
      name_en = I18n.with_locale(:en) { group_name }
      hash[:name] = name_fr
      hash[:name_en] = (name_en != name_fr) ? name_en : ""

      hash[:problems] = problems.map{|p| { name: p.name_debug, id: p.id, grade: p.grade } }

      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(location, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features
    )

    respond_to do |format|
      format.geojson do
        render json: JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))
      end
    end
  end
end