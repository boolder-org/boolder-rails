class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: "nico", password: Rails.application.credentials.dig(:admin, :http_password)
  layout "admin"
end