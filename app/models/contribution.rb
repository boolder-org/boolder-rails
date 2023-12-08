class Contribution < ApplicationRecord
  has_many_attached :photos
  has_many_attached :line_drawings
  has_many_attached :location_drawings
  belongs_to :problem

  include Geolocatable
  geolocatable :location
end