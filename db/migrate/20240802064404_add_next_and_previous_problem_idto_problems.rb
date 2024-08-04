class AddNextAndPreviousProblemIdtoProblems < ActiveRecord::Migration[7.1]
  def change
    add_column :problems, :next_id, :integer
    add_column :problems, :previous_id, :integer

    add_column :problems, :topo_next_id, :integer
    add_column :problems, :topo_previous_id, :integer
  end
end
