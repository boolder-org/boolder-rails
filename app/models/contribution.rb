class Contribution < ApplicationRecord
  include Geolocatable
  geolocatable :location

  has_many_attached :photos
  has_many_attached :line_drawings
  has_many_attached :location_drawings
  belongs_to :problem, optional: true

  audited

  STATES = %w(pending accepted closed)
  scope :pending, -> { where(state: "pending") }
  scope :accepted, -> { where(state: "accepted") }
  scope :closed, -> { where(state: "closed") }

  validates :state, inclusion: { in: STATES }
end