class Admin::ContributionsController < Admin::BaseController
  def index
    arel = Contribution.all.order(id: :desc)

    if params[:state].in?(Contribution::STATES)
      arel = arel.where(state: params[:state])
    end

    @contributions = arel
  end

  def edit
    @contribution = Contribution.find(params[:id])
  end

  def update
    @contribution = Contribution.find(params[:id])

    @contribution.assign_attributes(contribution_params)

    @contribution.save!

    flash[:notice] = "Contribution updated"
    redirect_to admin_contributions_path
  end

  private 
  def contribution_params
    params.require(:contribution).
      permit(:state)
  end
end
