class Admin::ContributeController < Admin::BaseController
  def dashboard
    @missing = params[:missing].presence_in(%w( location line )) || session[:last_missing] || "location"
    session[:last_missing] = @missing

    filtered = ->(arel, missing) { missing == "line" ? arel.without_line_only : arel.without_location }
  end
end
