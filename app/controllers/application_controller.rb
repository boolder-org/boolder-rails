class ApplicationController < ActionController::Base
  default_form_builder DefaultFormBuilder
  around_action :switch_locale
  before_action :set_alternate_tags
  before_action :dismiss_banner

  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def set_alternate_tags
    set_meta_tags alternate: { 
      "fr" => request.original_url.sub("/#{I18n.locale}", '/fr'),
      "en" => request.original_url.sub("/#{I18n.locale}", '/en'),
      # "x-default" => root_url(locale: nil),
    }
  end

  def dismiss_banner
    if params[:dismiss_banner].present?
      cookies[:open_source_launch] = { value: 'dismissed', expires: 1.month.from_now }
    end
  end
end
