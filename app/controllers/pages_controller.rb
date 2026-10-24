class PagesController < ApplicationController
  skip_before_action :set_alternate_tags, only: :bleau_info_partnership

  def bleau_info_partnership
  end

  def app
  end

  def privacy
  end

  def about
  end

  def contribute
  end
end
