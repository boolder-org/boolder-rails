class Circuit < ApplicationRecord
  has_many :problems
  has_many :areas, -> { distinct }, through: :problems

  default_scope { order(order: :asc, id: :asc) }

  COLOR_VALUES = %w(yellow purple orange green blue skyblue salmon red black white)

  COLOR_VALUES.each do |color|
    scope color, -> { where(color: color) } 
  end

  validates :color, inclusion: { in: COLOR_VALUES }

  def sorted_problems
    problems.
      select{|p| p.location.present? }.
      sort_by{|p| p.circuit_number.to_i + (p.circuit_number.include?('b') ? 0.5 : 0) }
  end

  def name
      I18n.t("circuit.name.#{color}")
  end

  def main_area
    areas.first
  end

  def average_grade
    problems_with_grade = problems.select{|p| p.grade.in?(Problem::GRADE_VALUES)}
    grades_int = problems_with_grade.map{|p| Problem::GRADE_VALUES.index(p.grade) }
    average_int = average(grades_int).round
    Problem::GRADE_VALUES[average_int].gsub("+", "")
  end

  # def risky?
  #   average_risk_score >= 4
  # end

  # def average_risk_score
  #   problems_with_landing_and_height = problems.select{|p| p.landing.present? && p.height.present? }
  #   risk_scores =problems_with_landing_and_height.map{|p| p.risk_score }
  #   return 0 if risk_scores.count == 0
  #   average(risk_scores).round(1)
  # end

  private
  def average(array)
    array.reduce(:+) / array.size.to_f
  end
end
