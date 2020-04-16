class Circuit < ApplicationRecord
  has_many :problems

  def sorted_problems
    problems.sort_by{|p| p.circuit_number.to_s.rjust(8, "0")}
  end
end
