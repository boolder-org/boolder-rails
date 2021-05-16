class WelcomeController < ApplicationController
  layout false, only: [:soon]

  def index
    @beginner_areas = Area.published.reject{|a| a.id == 7}.
      map{|a| [a, a.problems.where("grade < '4a'").count ]}.
      sort_by(&:second).reverse
  end

  def root
    http_lang = extract_locale_from_accept_language_header
    logger.debug "HTTP_ACCEPT_LANGUAGE: #{http_lang}"

    preferred_locale = ([http_lang.to_sym] & I18n.available_locales).first
    redirect_to root_localized_path(locale: preferred_locale || I18n.default_locale)
  end

  private
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
end
