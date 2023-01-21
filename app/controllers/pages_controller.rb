class PagesController < ApplicationController
  def app
  end

  def privacy
  end

  def about
    # TODO: remove after february 2023
    cookies[:open_source_launch] = { value: 'dismissed', expires: 1.month.from_now }
  end
end
