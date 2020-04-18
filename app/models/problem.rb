class Problem < ApplicationRecord
  belongs_to :circuit

  def circuit_desc
		[circuit.color, circuit_number].compact.join('-')
  end
end
