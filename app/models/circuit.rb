class Circuit < ApplicationRecord
  belongs_to :area
  has_many :problems

  def sorted_problems
    problems.sort_by{|p| p.circuit_number.to_i + (p.circuit_number.include?('b') ? 0.5 : 0) }
  end
end
