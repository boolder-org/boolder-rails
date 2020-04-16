class AddCircuitNumberToProblems < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :circuit_number, :string
  end
end
