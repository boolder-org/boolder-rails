class Mapping::ContributionRequestsController < ApplicationController
  def index
    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = ContributionRequest.open.where.not(location_estimated: nil).group_by(&:location_estimated).map do |location, requests|
      problems = requests.map(&:problem)
      problem = problems.sort_by{|p| p.ascents.to_i }.reverse.first

      hash = {}.with_indifferent_access

      hash.merge!(problem.slice(:grade, :steepness, :featured, :popularity))
      hash[:id] = problem.id
      # hash[:circuit_color] = problem.circuit&.color
      # hash[:circuit_id] = problem.circuit_id_simplified
      # hash[:circuit_number] = problem.circuit_number_simplified

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

    respond_to do |format|
      format.json do
        render json: JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))
      end
    end
  end
end