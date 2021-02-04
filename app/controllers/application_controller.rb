class ApplicationController < ActionController::Base
  default_form_builder DefaultFormBuilder
  around_action :switch_locale
  before_action :beta_blocker

  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def beta_blocker
    redirect_to soon_path unless (session[:beta] == "true" || params[:beta] == "true")
  end
end
