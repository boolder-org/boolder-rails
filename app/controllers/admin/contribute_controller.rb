class Admin::ContributeController < Admin::BaseController
  def dashboard
    @missing = params[:missing].presence_in(%w[ location line ]) || session[:last_missing] || "location"
    session[:last_missing] = @missing

    filtered = ->(arel, missing) { missing == "line" ? arel.without_line_only : arel.without_location }

    @areas_with_stats = Area.published.
      map { |a| OpenStruct.new(
          area: a,
          ascents: a.problems.sum(:ascents),
          completion: 1 - filtered.call(a.problems, @missing).sum(:ascents).to_f / a.problems.sum(:ascents).to_f,
          upcoming_completion: 1 - filtered.call(a.problems, @missing).without_contribution_request.sum(:ascents).to_f / a.problems.sum(:ascents).to_f
        )
      }.
      sort_by(&:ascents).reverse
  end
end
