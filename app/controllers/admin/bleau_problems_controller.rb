class Admin::BleauProblemsController < Admin::BaseController
  def index
    @bleau_problems = BleauProblem.
      left_outer_joins(:problem).where(problems: { id: nil }).
      order("ascents DESC NULLS LAST")

    @problems_with_name_mismatch = Problem.joins(:bleau_problem).where("problems.name IS DISTINCT FROM bleau_problems.name")

    @problems_with_grade_mismatch = Problem.joins(:bleau_problem).where("problems.grade IS DISTINCT FROM bleau_problems.grade")
      # select{|p| (Problem::GRADE_VALUES.index(p.grade)-Problem::GRADE_VALUES.index(p.bleau_problem.grade)).abs > 10 }

    @problems_with_sit_start_mismatch = Problem.joins(:bleau_problem).where("problems.sit_start IS DISTINCT FROM bleau_problems.sit_start").reject{|p| p.sit_start && p.name&.include?("assis)") }
  end
end
