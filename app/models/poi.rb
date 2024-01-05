class Poi < ApplicationRecord
  has_many :poi_routes
  has_many :areas

  audited

  TYPE_VALUES = %w(parking train_station)

  validates :poi_type, inclusion: { in: TYPE_VALUES }

  scope :train_station, -> { where(poi_type: "train_station") }
  scope :parking, -> { where(poi_type: "parking") }

  def parking?
    poi_type.to_s == "parking"
  end

  def train_station?
    poi_type.to_s == "train_station"
  end
end
