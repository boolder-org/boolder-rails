class Admin::BleauProblemsController < Admin::BaseController
  def index
    # TODO: make this code DRY with bleau.rake
    @bleau_problems = BleauProblem.joins(bleau_area: :area).where(ignore: false).
      left_outer_joins(:problem).where(problems: { id: nil }).
      order("ascents DESC NULLS LAST")

    # TODO: make this code DRY with bleau.rake
    @problems_with_name_mismatch = Problem.joins(:bleau_problem).where("problems.name IS DISTINCT FROM bleau_problems.name")

    # TODO: make this code DRY with bleau.rake
    @problems_with_grade_mismatch = Problem.joins(:bleau_problem).where("problems.grade IS DISTINCT FROM bleau_problems.grade")
    # select{|p| (Problem::GRADE_VALUES.index(p.grade)-Problem::GRADE_VALUES.index(p.bleau_problem.grade)).abs > 10 }

    # TODO: make this code DRY with bleau.rake
    @problems_with_sit_start_mismatch = Problem.joins(:bleau_problem).where("problems.sit_start IS DISTINCT FROM bleau_problems.sit_start").reject { |p| p.sit_start && p.name&.include?("assis)") }
  end

  def toggle_ignore
    @bleau_problem = BleauProblem.find(params[:id])
    @bleau_problem.update!(ignore: params[:ignore])
    action = params[:ignore] ? "ignored" : "unignored"
    redirect_to admin_bleau_problems_path, notice: "Bleau problem ##{@bleau_problem.id} has been #{action}"
  end
end
