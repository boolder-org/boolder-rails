class Sector < ApplicationRecord
  has_many :problems
  has_many :areas, -> { distinct }, through: :problems

  audited

  COLOR_VALUES = %w(yellow purple orange green blue skyblue salmon red black white)

  COLOR_VALUES.each do |color|
    scope color, -> { where(color: color) } 
  end

  validates :color, inclusion: { in: COLOR_VALUES }

  def name
      I18n.t("sector.name.#{color}")
  end

  def main_area
    problems.order(:sector_number).first.area
  end

  def bounds
    @bounds ||= {
      south_west: FACTORY.point(problems.minimum("st_xmin(location::geometry)"), problems.minimum("st_ymin(location::geometry)")),
      north_east: FACTORY.point(problems.maximum("st_xmax(location::geometry)"), problems.maximum("st_ymax(location::geometry)"))
    }
  end

  def average_grade
    problems_with_grade = problems.select{|p| p.grade.in?(Problem::GRADE_VALUES)}
    grades_int = problems_with_grade.map{|p| Problem::GRADE_VALUES.index(p.grade) }
    average_int = average(grades_int).round
    Problem::GRADE_VALUES[average_int].gsub("+", "")
  end

  def dangerous?
    risk.present? && risk >= 3
  end

  def beginner_friendly?
    risk.present? && risk <= 1 && 
    average_grade < '4a' &&
    !id.in?([89, 155, 156, 14]) # other reasons (eg. paint is not visible enough)
  end

  # def estimated_risk
  #   problems_with_landing_and_height = problems.select{|p| p.landing.present? && p.height.present? }
  #   risk_scores = problems_with_landing_and_height.map{|p| p.risk_score }
  #   return 0 if risk_scores.count == 0
  #   average(risk_scores).round(1)
  # end

  private
  def average(array)
    array.reduce(:+) / array.size.to_f
  end
end
