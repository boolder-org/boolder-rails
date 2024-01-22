class BleauProblem < ApplicationRecord
  belongs_to :bleau_area
  has_one :problem, foreign_key: "bleau_info_id"

  # TODO: make DRY with problem.rb
  validates :steepness, inclusion: { in: Problem::STEEPNESS_VALUES }
  validates :grade, inclusion: { in: Problem::GRADE_VALUES }, allow_blank: true
  validates :circuit_letter, inclusion: { in: Problem::LETTERS.keys }, allow_blank: true
  validate :validate_circuit_number_is_numeric

  normalizes :name, with: -> s { s.strip.gsub(/\A-\z/, '').presence }

  def name_with_fallback
    if name.present?
      name
    else
      I18n.t("problem.no_name")
    end 
  end

  def validate_circuit_number_is_numeric
    return if circuit_number.blank? || circuit_number == Problem::LETTER_START || circuit_number == "A"
    if circuit_number.to_i < 1
      errors.add(:circuit_number, "must be a number or D (for Départ)")
    end
  end
end
