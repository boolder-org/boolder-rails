class AddEndIdToProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :problems, :end_id, :integer
    add_index :problems, :end_id
  end
end
