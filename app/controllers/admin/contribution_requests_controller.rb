class Admin::ContributionRequestsController < Admin::BaseController
  def show
    contribution_request = ContributionRequest.find(params[:id])
    redirect_to edit_admin_contribution_request_path(contribution_request)
  end

  def new 
    @problem = Problem.find(params[:problem_id])

    @contribution_request = @problem.contribution_requests.build(location_estimated: location_estimated_in_session)
  end

  def create
    contribution_request = ContributionRequest.new(what: "photo", state: "open")
    contribution_request.assign_attributes(contribution_request_params)

    contribution_request.save!

    save_location_estimated_in_session(contribution_request.location_estimated)

    flash[:notice] = "Contribution Request created"
    redirect_to [:admin, contribution_request.problem]
  end

  def edit
    @contribution_request = ContributionRequest.find(params[:id])

    save_location_estimated_in_session(@contribution_request.location_estimated)
  end

  def update
    @contribution_request = ContributionRequest.find(params[:id])

    @contribution_request.assign_attributes(contribution_request_params)

    @contribution_request.save!

    save_location_estimated_in_session(@contribution_request.location_estimated)

    flash[:notice] = "Contribution request updated"
    redirect_to [:admin, @contribution_request.problem]
  end

  private 
  def contribution_request_params
    params.require(:contribution_request).
      permit(:problem_id, :location_estimated_lat, :location_estimated_lon)
  end

  def save_location_estimated_in_session(location)
    session[:last_location_estimated_lat] = location.lat
    session[:last_location_estimated_lon] = location.lon
  end

  def location_estimated_in_session
    if session[:last_location_estimated_lat].present? && session[:last_location_estimated_lon].present?
      "POINT(#{session[:last_location_estimated_lon]} #{session[:last_location_estimated_lat]})"
    end
  end
end