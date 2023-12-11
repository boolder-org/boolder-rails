class Contribution < ApplicationRecord
  include Geolocatable
  geolocatable :location

  has_many_attached :photos
  has_many_attached :line_drawings
  has_many_attached :location_drawings
  belongs_to :problem

  STATES = %w(pending accepted closed)
  scope :pending, -> { where(state: "pending") }

  validates :state, inclusion: { in: STATES }
end