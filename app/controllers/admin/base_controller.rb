class Admin::BaseController < ApplicationController
  include Authentication
  default_form_builder DefaultFormBuilder
  layout "admin"
  before_action :set_cookie

  private

  # used by audited gem (see config/initializers/audited.rb)
  def authenticated_user
    session[:admin_user_name]
  end

  def set_cookie
    session[:admin] = true
  end
end
