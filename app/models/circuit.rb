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

  def dangerous?
    risk >= 3
  end

  def beginner_friendly?
    risk.present? && risk <= 1 && 
    average_grade < '4a' &&
    !id.in?([89, 155, 156]) # other reasons (eg. paint is not visible enough)
  end

  private
  def average(array)
    array.reduce(:+) / array.size.to_f
  end
end
