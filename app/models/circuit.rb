class Circuit < ApplicationRecord
  belongs_to :area
  has_many :problems

  default_scope { order(order: :asc, id: :asc) }

  COLOR_VALUES = %w(yellow orange blue skyblue red black white)

  validates :color, inclusion: { in: COLOR_VALUES }

  def sorted_problems
    problems.
      select{|p| p.location.present? }.
      sort_by{|p| p.circuit_number.to_i + (p.circuit_number.include?('b') ? 0.5 : 0) }
  end

  def level
  	id == 1 ? :beginner : :unknown
  end

  def name
      I18n.t("circuit.name.#{color}")
  end
end
