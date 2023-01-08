class PoiRoute < ApplicationRecord
  belongs_to :area
  belongs_to :poi

  def distance_in_minutes
    (distance.to_f / 80).round
  end

  def description
    "#{poi.name} (#{distance_in_minutes} min)"
  end
end
