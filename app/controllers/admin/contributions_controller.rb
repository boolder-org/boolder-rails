class Admin::ContributionsController < Admin::BaseController
  def index
    arel = Contribution.all.order(id: :desc)

    if params[:state].in?(Contribution::STATES)
      session[:contributions_filter] = params[:state]
      arel = arel.where(state: params[:state])
    end

    @contributions = arel
  end

  def edit
    set_contribution
  end

  def update
    set_contribution

    if @contribution.update(contribution_params)
      flash[:notice] = "Contribution updated"
      redirect_to edit_admin_contribution_path(@contribution)
    else
      flash[:error] = @contribution.errors.full_messages.join('; ')
      render "edit", status: :unprocessable_entity
    end
  end

  private 
  def contribution_params
    params.require(:contribution).
      permit(:state)
  end

  def set_contribution
    @contribution = Contribution.find(params[:id])
  end
end
