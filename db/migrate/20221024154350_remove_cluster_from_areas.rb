class RemoveClusterFromAreas < ActiveRecord::Migration[6.1]
  def change
    remove_column :areas, :cluster
  end
end
