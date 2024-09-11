class AddTopoBoulderAndIndex < ActiveRecord::Migration[7.1]
  def change
    add_column :topos, :boulder_id, :integer
    add_column :topos, :position, :integer
    add_index :topos, [:boulder_id, :position], unique: true
    add_index :topos, :boulder_id
  end
end
