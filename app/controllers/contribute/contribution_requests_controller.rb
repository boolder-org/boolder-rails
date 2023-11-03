class Contribute::ContributionRequestsController < Contribute::BaseController
  def index
    @area = Area.find(params[:area_id])
    
    @requests = ContributionRequest.joins(:problem).
      where(problems: { area_id: @area.id }).
      where(what: "photo").
      # where("ascents >= ?", MIN_ASCENTS).
      order("ascents DESC NULLS LAST")
  end

  def dashboard
    @areas = Area.published.
      map{|a| [
          a, 
          a.problems.joins(:contribution_requests).where(contribution_requests: { what: "photo" }).count,
          1 - a.problems.joins(:contribution_requests).where(contribution_requests: { what: "photo" }).sum(:ascents).to_f / a.problems.sum(:ascents).to_f
        ]
      }.
      sort_by(&:second).reverse
  end

  def edit
    @contribution_request = ContributionRequest.find(params[:id])
  end

  def update
    @contribution_request = ContributionRequest.find(params[:id])

    @contribution_request.assign_attributes(contribution_request_params)

    lat = params[:contribution_request][:location_estimated_lat]
    lon = params[:contribution_request][:location_estimated_lon]

    if lat.present? && lon.present?
      @contribution_request.location_estimated = "POINT(#{lon} #{lat})"      
    end

    @contribution_request.save!

    flash[:notice] = "Contribution request updated"
    redirect_to contribute_problem_path(@contribution_request.problem)
  end

  private 
  def contribution_request_params
    params.require(:contribution_request).
      permit(:comment)
  end
end
