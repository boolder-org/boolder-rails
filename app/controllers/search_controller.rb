class SearchController < ApplicationController
  def search
    query = params[:query]
    show_unpublished = params[:show_unpublished].present?

    area_results = perform_area_search(query)

    problem_results = perform_problem_search(query, show_unpublished)

    render json: format_results(area_results, problem_results)
  end

  private

  def perform_area_search(query)
    tsearch_results = Area.published.tsearch_search(query).includes(:boulders).limit(10).to_a
    return tsearch_results if tsearch_results.present?

    trigram_low_results = Area.published.trigram_search_low_threshold(query).includes(:boulders).limit(3).to_a
    trigram_low_results
  end

  def perform_problem_search(query, show_unpublished)
    tsearch_results = Problem.tsearch_search(query).with_unpublished(show_unpublished).includes(:area, :sector).limit(10).to_a
    return tsearch_results if tsearch_results.present?

    trigram_low_results = Problem.trigram_search_low_threshold(query).with_unpublished(show_unpublished).includes(:area, :sector).limit(9).to_a
    trigram_low_results
  end

  def format_results(area_results, problem_results)
    formatted_results = area_results.map do |area|
      {
        id: area.id,
        name: area.name,
        bounds: area.serialized_bounds,
        type: 'Area'
      }
    end

    formatted_results += problem_results.map do |problem|
      {
        id: problem.id,
        name: problem.name,
        area_name: problem.area.name,
        published: problem.published?,
        sector_number: problem.problem_number_simplified,
        sector_color: problem.sector&.color,
        geolocation: problem.geolocation,
        grade: problem.grade,
        type: 'Problem'
      }
    end

    formatted_results
  end
end
