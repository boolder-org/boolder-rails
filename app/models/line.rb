class Line < ApplicationRecord
  belongs_to :problem, touch: true
  belongs_to :topo
  accepts_nested_attributes_for :topo

  audited

  after_save -> { problem.update_has_line }
  after_destroy -> { problem.update_has_line }

  validate :validate_line_length

  scope :published, -> { joins(:topo).where(topos: { published: true }) }
  scope :unpublished, -> { joins(:topo).where(topos: { published: false }) }
  scope :with_coordinates, -> { where.not(coordinates: nil) }
  default_scope { order(created_at: :asc) } # TODO: use a dedicated order column for multi-topos problems (e.g. traverses)

  def secondary_lines
    (topo.lines.reject{|l| l.problem.parent_id.present?} - [self]).
      select{|l| l.problem.lines.published.first&.topo_id == self.topo_id } # TODO: simplify once we handle ordering of multiple lines
  end

  private

  def validate_line_length
    if coordinates && coordinates.length < 3
      errors.add(:coordinates, "must have at least 3 points")
    end
  end
end
