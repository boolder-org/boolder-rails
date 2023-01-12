class Poi < ApplicationRecord
  # has_many :areas

  TYPE_VALUES = %w(parking train_station)

  validates :poi_type, inclusion: { in: TYPE_VALUES }

  def parking?
    poi_type.to_s == "parking"
  end

  def train_station?
    poi_type.to_s == "train_station"
  end
end
