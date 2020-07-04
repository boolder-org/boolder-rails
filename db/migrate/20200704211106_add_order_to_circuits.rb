class AddOrderToCircuits < ActiveRecord::Migration[6.0]
  def change
    add_column :circuits, :order, :integer
  end
end
