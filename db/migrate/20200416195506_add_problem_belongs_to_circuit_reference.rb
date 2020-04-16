class AddProblemBelongsToCircuitReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :problems, :circuit, index: true
  end
end
