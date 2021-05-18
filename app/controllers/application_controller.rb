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
    locales = (I18n.available_locales - [I18n.locale])

    paths = locales.map do |locale| 
      [
        locale,
        request.env['PATH_INFO'].sub("/#{I18n.locale}", "/#{locale}")
      ]
    end

    set_meta_tags alternate: paths.to_h
  end
end
