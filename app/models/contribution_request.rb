class ContributionRequest < ApplicationRecord
  include Geolocatable
  geolocatable :location_estimated

  belongs_to :problem

  audited
  
  STATES = %w(open closed)
  scope :open, -> { where(state: "open") }
  scope :closed, -> { where(state: "closed") }

  validates :location_estimated, presence: true
  validates :state, inclusion: { in: STATES }
end
