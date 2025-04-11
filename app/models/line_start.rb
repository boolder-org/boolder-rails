class LineStart < ApplicationRecord
  belongs_to :topo
  has_many :lines, foreign_key: :start_id
  # TODO: compute x;y

  def overlaps?(line)
    return false if line.start_point.blank?

    lines.map { |l| l.start_point }.compact.any? do |point|
      dx = point["x"] - line.start_point["x"]
      dy = point["y"] - line.start_point["y"]
      Math.sqrt(dx * dx + dy * dy) < 0.03
    end
  end
end
