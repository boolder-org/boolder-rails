class Admin::TasksController < Admin::BaseController
  def index
    @area = Area.find_by(slug: params[:area_slug])
    
    @add_location = @area.problems.joins(:bleau_problem). #order("ascents DESC NULLS LAST").
      where(location: nil)

    @add_photo = @area.problems.joins(:bleau_problem). #order("ascents DESC NULLS LAST").
      joins("LEFT JOIN lines ON lines.problem_id = problems.id").where("lines.problem_id IS NULL").uniq

    @add_line = @area.problems.joins(:bleau_problem). #order("ascents DESC NULLS LAST").
      joins("LEFT JOIN lines ON lines.problem_id = problems.id").where("lines.coordinates IS NULL AND lines.problem_id IS NOT NULL").uniq

    @action_needed = @area.problems.joins(:bleau_problem).where(action_needed: true)

    @problems = (@add_location + @add_photo + @add_line + @action_needed).uniq.sort_by{|p| p.bleau_problem.ascents.to_i }.reverse

    @bleau_problems = BleauProblem.
      left_outer_joins(:problem).where(problems: { id: nil }).
      where(bleau_area_id: BleauArea.find_by(slug: "isatis").id).
      # where.not(ascents: nil).
      order("ascents DESC NULLS LAST")
  end

  def dashboard
    @areas = Area.order(:name)
  end
end
