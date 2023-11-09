class Contribute::ContributionsController < Contribute::BaseController
  def show
    @contribution = Contribution.find(params[:id])
  end

  def new
    @contribution = Contribution.new(
      problem_id: params[:problem_id],
      name: session[:contribution_name],
      email: session[:contribution_email],
    )
  end

  def create
    @contribution = Contribution.new(contribution_params)

    session[:contribution_name] = @contribution.name
    session[:contribution_email] = @contribution.email
    
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
      :location, :comment, :problem_id, :name, :email,
      photos: [], line_drawings: [], location_drawings: []
    )
  end
end
