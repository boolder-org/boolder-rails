class RedirectsController < ApplicationController
  def new
    if problem_id = params[:problem_id]
      redirect_to helpers.problem_friendly_path(Problem.find(problem_id))
    elsif area_id = params[:area_id]
      redirect_to area_path(Area.find(area_id))
    elsif bleau_info_id = params[:bleau_info_id]
      if problem = Problem.where(bleau_info_id: bleau_info_id.to_i).first
        redirect_to helpers.problem_friendly_path(problem)
      else
        redirect_to root_path
      end
    else
      redirect_to root_localized_path
    end
  end
end
