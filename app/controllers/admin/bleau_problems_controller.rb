class Admin::BleauProblemsController < Admin::BaseController
  def index
    @bleau_problems = BleauProblem.
      left_outer_joins(:problem).where(problems: { id: nil }).
      # where(bleau_area_id: Area.find(4).bleau_area_id).
      # where.not(ascents: nil).
      order("ascents DESC NULLS LAST")
  end
end
