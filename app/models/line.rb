class Line < ApplicationRecord
  belongs_to :problem, touch: true
  belongs_to :topo

  scope :published, -> { joins(:topo).where(topos: { published: true }) }
end
