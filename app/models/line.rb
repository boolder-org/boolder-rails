class Line < ApplicationRecord
  belongs_to :problem, touch: true
  belongs_to :topo

  scope :published, -> { joins(:topo).where(topos: { published: true }) }
  scope :unpublished, -> { joins(:topo).where(topos: { published: false }) }
  default_scope { order(created_at: :asc) } # TODO: use a dedicated order column for multi-topos problems (e.g. traverses)

end
