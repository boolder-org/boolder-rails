class AddParentIdToProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :parent_id, :bigint, index: true
  end
end
