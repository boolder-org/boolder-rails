class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :set_alternate_tags
  before_action :dismiss_banner

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

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

  private

  def dismiss_banner
     if params[:dismiss_banner].present?
       cookies[:contribute_launch] = { value: 'dismissed', expires: 1.month.from_now }
     end
   end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
  end
end
