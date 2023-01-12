class RemoveOrderFromCircuits < ActiveRecord::Migration[6.1]
  def change
    remove_column :circuits, :order
  end
end
