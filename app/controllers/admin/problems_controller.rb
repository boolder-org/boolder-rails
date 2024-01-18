class Admin::ProblemsController < Admin::BaseController
  def index
    @area = Area.find_by(slug: params[:area_slug])

    if params[:circuit_id] == "first" && (id = @area.sorted_circuits.first&.id)
      redirect_to admin_area_problems_path(area_slug: @area.slug, circuit_id: id) 
    end

    arel = Problem.where(area_id: @area.id) 

    arel = if params[:circuit_id].to_i > 0
      arel.where(circuit_id: params[:circuit_id]).sort_by(&:enumerable_circuit_number) if params[:circuit_id].present?
    else
      arel.order(ascents: :desc)
    end

    arel = if params[:missing] == "line"
      arel.where(has_line: false).with_location
    elsif params[:missing] == "location"
      arel.without_location
    else
      arel
    end

    @problems = arel

    circuits = @area.sorted_circuits
    @circuit_tabs = circuits.map{|c| [c.id, c.name] }.push([nil, "All"])

    @missing_grade = @area.problems.where("grade IS NULL OR grade = ''")
  end

  def new
    area = Area.find(params[:area_id])

    @problem = Problem.new(steepness: :other)

    @problem.area = area
    @circuits = area.sorted_circuits
  end

  def create
    problem = Problem.new
    problem.assign_attributes(problem_params)

    problem.save!

    flash[:notice] = "Problem created"
    redirect_to [:admin, problem]
  end

  def show
    problem = Problem.find(params[:id])
    redirect_to edit_admin_problem_path(problem)
  end

  def edit
    set_problem
  end

  def update
    set_problem

    @problem.assign_attributes(problem_params)
    
    if @problem.save
      flash[:notice] = "Problem updated"
      redirect_to edit_admin_problem_path(@problem)
    else
      flash[:error] = @problem.errors.full_messages.join('; ')
      render "admin/problems/edit", status: :unprocessable_entity
    end
  end

  private 
  def problem_params
    params.require(:problem).
      permit(:area_id, :name, :grade, :steepness, :sit_start,
        :bleau_info_id, :circuit_number, :circuit_letter, :circuit_id, :parent_id,
      )
  end

  def set_problem
    @problem = Problem.find(params[:id])
    @circuits = @problem.area.sorted_circuits
  end
end
