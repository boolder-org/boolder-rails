class Problem < ApplicationRecord
  belongs_to :circuit

  def circuit_desc
		[circuit.color, circuit_number].compact.join('-')
  end

  def self.u(color, number, height)
    circuit = Circuit.find_by!(color: color)
    problem = Problem.find_by!(circuit: circuit, circuit_number: number)
    problem.height = height
    problem.save!
  end
end
