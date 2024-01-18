class Line < ApplicationRecord
  belongs_to :problem, touch: true
  belongs_to :topo

  audited

  after_save -> { problem.update_has_line }
  after_destroy -> { problem.update_has_line }

  scope :published, -> { joins(:topo).where(topos: { published: true }) }
  scope :unpublished, -> { joins(:topo).where(topos: { published: false }) }
  scope :with_coordinates, -> { where.not(coordinates: nil) }
  default_scope { order(created_at: :asc) } # TODO: use a dedicated order column for multi-topos problems (e.g. traverses)

end
