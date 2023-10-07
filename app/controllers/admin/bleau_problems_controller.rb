class Admin::BleauProblemsController < Admin::BaseController
  def index
    @bleau_problems = BleauProblem.
      left_outer_joins(:problem).where(problems: { id: nil }).
      order("ascents DESC NULLS LAST")
  end
end
