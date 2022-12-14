class AddRiskToCircuits < ActiveRecord::Migration[6.1]
  def change
    add_column :circuits, :risk, :integer, limit: 1
  end
end
