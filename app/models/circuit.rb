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

  # FIXME: use most nb of problems
  def main_area
  end

  def avg_grade
    problems_with_grade = problems.select{|p| p.grade.in?(Problem::GRADE_VALUES)}
    grades_int = problems_with_grade.map{|p| Problem::GRADE_VALUES.index(p.grade) }
    avg_int = avg(grades_int).round
    Problem::GRADE_VALUES[avg_int]
  end

  def median_grade
    problems_with_grade = problems.select{|p| p.grade.in?(Problem::GRADE_VALUES)}
    grades_int = problems_with_grade.map{|p| Problem::GRADE_VALUES.index(p.grade) }
    median_int = median(grades_int).round
    Problem::GRADE_VALUES[median_int]
  end

  def avg_height
    problems_with_height = problems.select{|p| p.height.present? }
    heights_int = problems_with_height.map{|p| p.height }
    return 0 if heights_int.count == 0
    avg(heights_int).round(1)
  end

  def median_height
    problems_with_height = problems.select{|p| p.height.present? }
    heights_int = problems_with_height.map{|p| p.height }
    return 0 if heights_int.count == 0
    median(heights_int)
  end

  def avg_landing_score
    mapping = { "easy" => 0, "medium" => 1, "hard" => 2 }
    problems_with_landing = problems.select{|p| p.landing.present? }
    landing_scores = problems_with_landing.map{|p| mapping[p.landing] }
    return 0 if landing_scores.count == 0
    avg(landing_scores).round(3)
  end

  def avg(array)
    array.reduce(:+) / array.size.to_f
  end

  def median(array)
    return nil if array.empty?
    sorted = array.sort
    len = sorted.length
    (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
end
