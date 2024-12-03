class AddRiskToSectors < ActiveRecord::Migration[6.1]
  def change
    add_column :sectors, :risk, :integer, limit: 1
  end
end
