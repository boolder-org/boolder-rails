class Boulder < ApplicationRecord
  belongs_to :area

  audited associated_with: :import
  attr_accessor :import # used by audited associated_with: :import
  include CheckConflicts

  normalizes :polygon, with: -> p { ensure_counter_clock_wise(p) }

  def clock_wise?
    self.class.clock_wise?(polygon)
  end

  private

  # TODO: move to polygon instance methods
  # or use rgeo for a more robust implementation when it's available
  def self.clock_wise?(polygon)
    signed_area(polygon) > 0
  end

  def self.signed_area(polygon)
    polygon.exterior_ring.points.each_cons(2).sum do |p1, p2|
      (p2.x - p1.x) * (p2.y + p1.y)
    end
  end

  def self.ensure_counter_clock_wise(polygon)
    raise "cannot modify interior ring" if polygon.interior_rings.present?

    if clock_wise?(polygon)
      reversed_coords = polygon.exterior_ring.points.reverse
      FACTORY.polygon(FACTORY.linear_ring(reversed_coords))
    else
      polygon
    end
  end

  # Run this query to make all boulders counter clock wise
  # Boulder.where("ST_IsPolygonCW(polygon::geometry) = true").update_all("polygon = ST_ForcePolygonCCW(polygon::geometry)")
end
