class Admin::LinesController < Admin::BaseController
  def edit
    set_line

    session[:last_topo_visited] = @line.topo.id
  end

  def show
    set_line
    redirect_to edit_admin_line_path(@line)
  end

  def new 
    problem = Problem.find(params[:problem_id])

    @line = Line.new(problem_id: problem.id)
    @line.build_topo # for topo nested attributes (photo)
  end

  def update
    set_line

    coordinates = JSON.parse(params[:line][:coordinates])
    
    if @line.update(coordinates: coordinates)
      auto_close_contribution_request(@line)
      
      flash[:notice] = "Line updated"
      redirect_to edit_admin_line_path(@line)
    else
      flash[:error] = @line.errors.full_messages.join('; ')
      render "edit", status: :unprocessable_entity
    end
  end

  def create
    @line = Line.new(line_params)

    if @line.save
      auto_close_contribution_request(@line)

      flash[:notice] = "Line created"
      redirect_to edit_admin_line_path(@line)
    else
      @line.build_topo # for topo nested attributes (photo)
      flash[:error] = @line.errors.full_messages.join('; ')
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    line = Line.find(params[:id])
    line.destroy!

    flash[:notice] = "Line destroyed"
    redirect_to admin_problem_path(line.problem)
  end

  private 
  def line_params
    params.require(:line).permit(:problem_id, :topo_id, topo_attributes: [:photo])
  end

  def set_line
    @line = Line.find(params[:id])
  end

  def auto_close_contribution_request(line)
    line.problem.contribution_requests.open.first&.update(state: "closed")
  end
end
