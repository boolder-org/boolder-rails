class Admin::BaseController < ApplicationController
  default_form_builder DefaultFormBuilder
  http_basic_authenticate_with name: "nico", password: Rails.application.credentials.dig(:admin, :http_password)
  layout "admin"
  before_action :set_cookie

  def set_cookie
    session[:admin] = true
  end
end