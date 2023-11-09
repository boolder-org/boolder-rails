class Contribute::ContributionsController < Contribute::BaseController
  def show
    @contribution = Contribution.find(params[:id])
  end

  def new
    @contribution = Contribution.new
    @contribution.problem_id = params[:problem_id] 
  end

  def create
    @contribution = Contribution.new(contribution_params)
    
    # TODO: make DRY
    lat = params[:contribution][:location_lat]
    lon = params[:contribution][:location_lon]

    if lat.present? && lon.present?
      @contribution.location = "POINT(#{lon} #{lat})"      
    end

    if @contribution.save
      flash[:notice] = "Contribution created!"
      redirect_to [:contribute, @contribution.problem]
    else
      # flash[:error] = "Error"
      render "new", status: :unprocessable_entity
    end
  end

  private
  def contribution_params
    params.require(:contribution).permit(
      :location, :comment, :problem_id, 
      photos: [], line_drawings: [], location_drawings: []
    )
  end
end
