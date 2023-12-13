class Mapping::ContributionsController < ApplicationController
  def show
    @contribution = Contribution.find(params[:id])
  end

  def new
    @contribution = Contribution.new(
      problem_id: params[:problem_id],
      contributor_name: session[:contribution_name],
      contributor_email: session[:contribution_email],
    )
  end

  def create
    @contribution = Contribution.new(contribution_params)

    session[:contribution_name] = @contribution.contributor_name
    session[:contribution_email] = @contribution.contributor_email

    if @contribution.save
      flash[:notice] = t("views.mapping.contributions.new.flash_success")

      ContributeMailer.with(contribution: @contribution).new_contribution_email.deliver_later

      redirect_to [:mapping, @contribution.problem]
    else
      # flash[:error] = "Error"
      render "new", status: :unprocessable_entity
    end
  end

  private
  def contribution_params
    params.require(:contribution).permit(
      :location_lat, :location_lon, :comment, :problem_id, :contributor_name, :contributor_email, :problem_name, :problem_url,
      photos: [], line_drawings: [], location_drawings: []
    )
  end
end
