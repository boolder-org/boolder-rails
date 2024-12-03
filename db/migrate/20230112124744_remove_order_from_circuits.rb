class RemoveOrderFromSectors < ActiveRecord::Migration[6.1]
  def change
    remove_column :sectors, :order
  end
end
