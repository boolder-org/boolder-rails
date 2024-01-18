class Admin::ContributeController < Admin::BaseController
  def dashboard
    @areas_with_stats = Area.published.
      map{|a| OpenStruct.new(
          area: a, 
          ascents: a.problems.sum(:ascents),
          completion: 1 - a.problems.without_location.sum(:ascents).to_f / a.problems.sum(:ascents).to_f,
          upcoming_completion: 1 - a.problems.without_location.without_contribution_request.sum(:ascents).to_f / a.problems.sum(:ascents).to_f
        )
      }.
      sort_by(&:ascents).reverse
  end
end
