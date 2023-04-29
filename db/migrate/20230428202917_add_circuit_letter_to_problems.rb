class AddCircuitLetterToProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :circuit_letter, :string
  end
end
