class Admin::ContributionsController < Admin::BaseController
  def index
    @contributions = Contribution.all.order(id: :desc)
  end

  def show
    @contribution = Contribution.find(params[:id])
  end

  def edit
    @contribution = Contribution.find(params[:id])
  end

  def update
    @contribution = Contribution.find(params[:id])

    @contribution.assign_attributes(contribution_params)

    @contribution.save!

    flash[:notice] = "Contribution updated"
    redirect_to admin_moderation_path
  end

  private 
  def contribution_params
    params.require(:contribution).
      permit(:state)
  end
end
