class ApplicationController < ActionController::Base
  default_form_builder DefaultFormBuilder
  around_action :switch_locale
  before_action :set_alternate_tags

  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def set_alternate_tags
    set_meta_tags alternate: { 
      "fr" => request.env['PATH_INFO'].sub("/#{I18n.locale}", '/fr'),
      "en" => request.env['PATH_INFO'].sub("/#{I18n.locale}", '/en') 
    }
  end
end
