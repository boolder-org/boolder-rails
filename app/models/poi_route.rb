class PoiRoute < ApplicationRecord
  belongs_to :area
  belongs_to :poi

  audited

  TRANSPORT_VALUES = %w(walking bike)

  validates :transport, inclusion: { in: TRANSPORT_VALUES }

  def bike?
    transport.to_s == "bike"
  end

  def walking?
    transport.to_s == "walking"
  end

  def distance_in_minutes
    if transport.to_s == "bike"
      friendly_round(distance.to_f / 240)
    else
      friendly_round(distance.to_f / 80)
    end
  end

  def description
    "#{poi.name} (#{distance_in_minutes} min)"
  end

  private
  def friendly_round(n)
    if n <= 2
      2
    else
      round_up(n.round, 5)
    end
  end

  def round_up(n, increment)
    increment * (( n + increment - 1) / increment)
  end
end
