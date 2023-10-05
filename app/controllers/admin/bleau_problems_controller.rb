class Admin::BleauProblemsController < Admin::BaseController
  def index
    # @area = Area.find_by(slug: params[:area_slug])
    @area = Area.find_by(slug: "cuvier")

    @bleau_problems = BleauProblem.
      left_outer_joins(:problem).where(problems: { id: nil }).
      where(bleau_area_id: BleauArea.find_by(slug: "cuvier").id).
      # where.not(ascents: nil).
      order("ascents DESC NULLS LAST")
  end
end
