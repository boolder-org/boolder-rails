class Admin::TasksController < Admin::BaseController
  def index
    @area = Area.find_by(slug: params[:area_slug])
    
    @todos = Todo.joins(:problem).where(problems: { area_id: @area.id }).order("ascents DESC NULLS LAST")

    @bleau_problems = BleauProblem.
      left_outer_joins(:problem).where(problems: { id: nil }).
      where(bleau_area_id: BleauArea.find_by(slug: "isatis").id).
      # where.not(ascents: nil).
      order("ascents DESC NULLS LAST")
  end

  def dashboard
    @areas_with_ascents = Todo.all.joins(:problem).group(:area_id).sum(:ascents).
      sort_by(&:second).reverse.
      select{|area_id, _| Area.find(area_id).published }
  end
end
