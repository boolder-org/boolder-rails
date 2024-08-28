class AddStartParentToProblems < ActiveRecord::Migration[7.1]
  def change
    add_column :problems, :start_parent_id, :integer # TODO: add index
    add_index :problems, :start_parent_id
  end
end
