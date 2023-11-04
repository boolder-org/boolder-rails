class Admin::ContributionRequestsController < Admin::BaseController
  def show
    contribution_request = ContributionRequest.find(params[:id])
    redirect_to edit_admin_contribution_request_path(contribution_request)
  end

  def new 
    @problem = Problem.find(params[:problem_id])
    @contribution_request = @problem.contribution_requests.build
  end

  def create
    contribution_request = ContributionRequest.new(what: "photo", state: "open")
    contribution_request.assign_attributes(contribution_request_params)

    # TODO: make DRY
    lat = params[:contribution_request][:location_estimated_lat]
    lon = params[:contribution_request][:location_estimated_lon]

    if lat.present? && lon.present?
      contribution_request.location_estimated = "POINT(#{lon} #{lat})"      
    end

    contribution_request.save!

    flash[:notice] = "Contribution Request created"
    redirect_to [:admin, contribution_request.problem]
  end

  def edit
    @contribution_request = ContributionRequest.find(params[:id])
  end

  def update
    @contribution_request = ContributionRequest.find(params[:id])

    @contribution_request.assign_attributes(contribution_request_params)

    # TODO: make DRY
    lat = params[:contribution_request][:location_estimated_lat]
    lon = params[:contribution_request][:location_estimated_lon]

    if lat.present? && lon.present?
      @contribution_request.location_estimated = "POINT(#{lon} #{lat})"      
    end

    @contribution_request.save!

    flash[:notice] = "Contribution request updated"
    redirect_to [:admin, @contribution_request.problem]
  end

  private 
  def contribution_request_params
    params.require(:contribution_request).
      permit(:comment, :problem_id)
  end
end