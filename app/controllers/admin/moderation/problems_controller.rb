class Admin::Moderation::ProblemsController < Admin::BaseController
  def dashboard
    @areas_with_stats = Area.published.
      map{|a| OpenStruct.new(
          area: a, 
          ascents: a.problems.sum(:ascents),
          completion: 1 - a.problems.without_photo.sum(:ascents).to_f / a.problems.sum(:ascents).to_f,
          upcoming_completion: a.problems.joins(:contribution_requests).sum(:ascents).to_f / a.problems.sum(:ascents).to_f
        )
      }.
      sort_by(&:ascents).reverse
  end

  def index
    @area = Area.find(params[:area_id])

    @problems = Problem.all.
      without_photo.
      where(problems: { area_id: @area.id }).
      order("ascents DESC NULLS LAST")

    @problems_with_topo_but_no_location = @area.problems.where(location: nil).joins(:topos).where(topos: { published: true })
  end
end
