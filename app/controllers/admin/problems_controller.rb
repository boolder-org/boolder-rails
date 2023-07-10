class Admin::ProblemsController < Admin::BaseController
  def index
    @area = Area.find_by(slug: params[:area_slug])

    if params[:circuit_id] == "first" && (id = @area.sorted_circuits.first&.id)
      redirect_to admin_area_problems_path(area_slug: @area.slug, circuit_id: id) 
    end

    arel = Problem.where(area_id: @area.id) 
    session[:area_id] = @area.id

    if params[:circuit_id] == "off_circuit"
      arel = arel.where(circuit_id: nil)
    elsif params[:circuit_id] == "all"
      arel = arel
    else
      arel = arel.where(circuit_id: params[:circuit_id]) if params[:circuit_id].present?
    end

    @problems = arel.sort_by(&:enumerable_circuit_number)

    circuits = @area.sorted_circuits
    @circuit_tabs = circuits.map{|c| [c.id, c.name] }.push(["off_circuit", "Off circuit"]).push(['all', "All"])

    @missing_location = @area.problems.where("location IS NULL")
    @missing_grade = @area.problems.where("grade IS NULL OR grade = ''")
  end

  def new
    area = Area.find(params[:area_id] || session[:area_id])

    @problem = Problem.new(steepness: :other)

    if bleau_problem_id = params[:bleau_problem_id].presence
      bleau_problem = BleauProblem.find bleau_problem_id

      # TODO: set area
      
      @problem.name = bleau_problem.name
      @problem.grade = bleau_problem.grade
      @problem.bleau_info_id = bleau_problem_id
      @problem.steepness = bleau_problem.steepness

      if bleau_problem.sit_start
        @problem.tags << "sit_start"
      end

      # TODO: set circuit
    end

    @problem.area = area
    @circuits = area.sorted_circuits
  end

  def create
    problem = Problem.new
    problem.assign_attributes(problem_params)
    problem.tags = params[:problem][:joined_tags].split(',')

    if bleau_problem = BleauProblem.find(params[:problem][:bleau_info_id]) 
      problem.ratings = bleau_problem.ratings
      problem.ratings_average = bleau_problem.ratings_average
      problem.ascents = bleau_problem.ascents
      # TODO : compute popularity
    end

    problem.save!

    flash[:notice] = "Problem created"
    redirect_to [:admin, problem]
  end

  def show
    problem = Problem.find(params[:id])
    redirect_to edit_admin_problem_path(problem)
  end

  def edit
    @problem = Problem.find(params[:id])
    @circuits = @problem.area.sorted_circuits
    session[:area_id] = @problem.area_id
  end

  def update
    problem = Problem.find(params[:id])

    problem.assign_attributes(problem_params)
    problem.tags = params[:problem][:joined_tags].split(',')
    
    if problem.save
      flash[:notice] = "Problem updated"
      redirect_to edit_admin_problem_path(problem)
    else
      flash[:error] = problem.errors.full_messages.join('; ')
      redirect_to edit_admin_problem_path(problem)
    end
  end

  private 
  def problem_params
    params.require(:problem).
      permit(:area_id, :name, :grade, :steepness, :height, 
        :bleau_info_id, :circuit_number, :circuit_letter, :circuit_id, :risky, :landing, :featured, :parent_id,
        :action_needed, :comment,
      )
  end
end
