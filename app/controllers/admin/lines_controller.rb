class Admin::LinesController < Admin::BaseController
  def edit
    @line = Line.find(params[:id])
  end

  def new 
    @ref_line = Line.find_by_id(params[:ref_line_id])

    @line = Line.new(
      problem_id: params[:problem_id], 
      topo_id: @ref_line&.topo_id || session[:last_topo_visited],
      coordinates: @ref_line&.coordinates
    )
  end

  def update
    line = Line.find(params[:id])

    coordinates = JSON.parse(params[:line][:coordinates])
    line.update(coordinates: coordinates)

    flash[:notice] = "Line updated"
    redirect_to edit_admin_line_path(line)
  end

  def create
    line = Line.new(line_params)

    coordinates = JSON.parse(params[:line][:coordinates])
    line.coordinates = coordinates

    line.save!

    flash[:notice] = "Line created"
    redirect_to edit_admin_line_path(line)
  end

  def destroy
    line = Line.find(params[:id])
    line.destroy!

    flash[:notice] = "Line destroyed"
    redirect_to edit_admin_problem_path(line.problem)
  end

  private 
  def line_params
    params.require(:line).permit(:problem_id, :topo_id)
  end
end
