class Admin::Moderation::ProblemsController < Admin::BaseController
  def dashboard
    @areas = Area.published.
      map{|a| [
          a, 
          a.problems.without_photo.count,
          a.problems.without_photo.sum(:ascents),
          1 - a.problems.without_photo.sum(:ascents).to_f / a.problems.sum(:ascents).to_f
        ]
      }.
      sort_by(&:second).reverse
  end

  def index
    @area = Area.find(params[:area_id])

    @problems = Problem.all.
      without_photo.
      where(problems: { area_id: @area.id }).
      order("ascents DESC NULLS LAST").take(10)
  end
end
