class DiscoverController < ApplicationController
  def index
    @beginner_areas = Area.published.any_tags(:beginner_friendly).all

    @intermediate_areas = 
      Area.published.
        reject{|a| a.id.in?([64, 69, 42]) }. # FIXME: use a tag to avoid tricky areas
        select{|a| a.problems.where("grade < '6a' AND grade >= '4a'").count >= 100 }

    @advanced_areas = 
      Area.published.
        reject{|a| a.id.in?([42]) }. # FIXME: use a tag to avoid *very* tricky areas (like Dame Jouanne (id=42))
        select{|a| a.problems.where("grade >= '6a'").count >= 100 }
  end
end
