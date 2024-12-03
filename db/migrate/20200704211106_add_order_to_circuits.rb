class AddOrderToSectors < ActiveRecord::Migration[6.0]
  def change
    add_column :sectors, :order, :integer
  end
end
