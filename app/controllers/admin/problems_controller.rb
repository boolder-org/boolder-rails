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

    @problems = arel.sort_by{|p| p.enumerable_circuit_number }

    circuits = @area.sorted_circuits
    @circuit_tabs = circuits.map{|c| [c.id, c.name] }.push(["off_circuit", "Off circuit"]).push(['all', "All"])

    @missing_location = @area.problems.where("location IS NULL")
    @missing_grade = @area.problems.where("grade IS NULL OR grade = ''")
  end

  def new
    area = Area.find(params[:area_id] || session[:area_id])
    @problem = Problem.new(area_id: area.id, steepness: :other)
    @circuits = area.sorted_circuits
    extracted_params = params[:extracted]

    if extracted_params.present?
      @problem.name = extracted_params[:name].strip
      @problem.grade = extracted_params[:grade].strip
      @problem.bleau_info_id = extracted_params[:id].strip

      @problem.circuit_number = extracted_params[:circuit_number].strip

      if extracted_params[:circuit].include?("jaune")
        @problem.circuit_id = area.sorted_circuits.yellow.first&.id
      elsif extracted_params[:circuit].include?("orange")
        @problem.circuit_id = area.sorted_circuits.orange.first&.id
      elsif extracted_params[:circuit].include?("bleu ciel")
        @problem.circuit_id = area.sorted_circuits.skyblue.first&.id
      elsif extracted_params[:circuit].include?("bleu")
        @problem.circuit_id = area.sorted_circuits.blue.first&.id
      elsif extracted_params[:circuit].include?("rouge")
        @problem.circuit_id = area.sorted_circuits.red.first&.id
      elsif extracted_params[:circuit].include?("noir")
        @problem.circuit_id = area.sorted_circuits.black.first&.id
      elsif extracted_params[:circuit].include?("blanc")
        @problem.circuit_id = area.sorted_circuits.white.first&.id
      end

      if extracted_params[:tags].include?("travers")
        @problem.steepness = :traverse
      elsif extracted_params[:tags].include?("toit")
        @problem.steepness = :roof
      elsif extracted_params[:tags].include?("dévers") || extracted_params[:tags].include?("surplomb")
        @problem.steepness = :overhang
      elsif extracted_params[:tags].include?("dalle")
        @problem.steepness = :slab
      elsif extracted_params[:tags].include?("mur")
        @problem.steepness = :wall
      else
        @problem.steepness = :other
      end

      if extracted_params[:tags].include?("assis")
        @problem.tags << "sit_start"
      end

      @problem.risky = extracted_params[:tags].include?("expo") || extracted_params[:tags].include?("haut")
    end
  end

  def create
    problem = Problem.new
    problem.assign_attributes(problem_params)
    problem.tags = params[:problem][:joined_tags].split(',')
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
    problem.save!

    flash[:notice] = "Problem updated"
    redirect_to admin_area_problems_path(anchor: problem.id, area_slug: problem.area.slug, circuit_id: problem.circuit_id || "off_circuit")
  end

  private 
  def problem_params
    params.require(:problem).
      permit(:area_id, :name, :grade, :steepness, :height, 
        :bleau_info_id, :circuit_number, :circuit_id, :risky, :landing, :featured, :parent_id
      )
  end
end
