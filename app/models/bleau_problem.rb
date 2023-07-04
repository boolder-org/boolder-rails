class BleauProblem < ApplicationRecord
  belongs_to :bleau_area

  # TODO: make DRY with problem.rb
  validates :steepness, inclusion: { in: Problem::STEEPNESS_VALUES }
  validates :grade, inclusion: { in: Problem::GRADE_VALUES }, allow_blank: true
  validates :circuit_letter, inclusion: { in: Problem::LETTERS.keys }, allow_blank: true
  validate :validate_circuit_letter_is_numeric

  def validate_circuit_letter_is_numeric
    return if circuit_number.blank? || circuit_number == LETTER_START
    if circuit_number.to_i < 1
      errors.add(:circuit_number, "must be a number or D (for Départ)")
    end
  end
end
