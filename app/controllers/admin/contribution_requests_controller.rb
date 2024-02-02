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
    @problem = Problem.find(params[:contribution_request][:problem_id])

    @contribution_request = ContributionRequest.new(what: "photo", state: "open")
    @contribution_request.assign_attributes(contribution_request_params)

    if @contribution_request.save
      flash[:notice] = "Contribution Request created"
      redirect_to [:admin, @contribution_request.problem]
    else
      flash[:error] = @contribution_request.errors.full_messages.join('; ')
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    set_contribution_request
  end

  def update
    set_contribution_request

    @contribution_request.assign_attributes(contribution_request_params)

    if @contribution_request.save
      flash[:notice] = "Contribution request updated"
      redirect_to [:admin, @contribution_request.problem]
    else
      flash[:error] = @contribution_request.errors.full_messages.join('; ')
      render "edit", status: :unprocessable_entity
    end
  end

  private 
  def contribution_request_params
    params.require(:contribution_request).
      permit(:problem_id, :location_estimated_lat, :location_estimated_lon, :state, :comment)
  end

  def set_contribution_request
    @contribution_request = ContributionRequest.find(params[:id])
  end
end