class AddStartIdToProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :problems, :start_id, :integer
    add_index :problems, :start_id
  end
end
