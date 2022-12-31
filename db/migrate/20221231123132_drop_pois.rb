class DropPois < ActiveRecord::Migration[6.1]
  def change
    drop_table :pois
  end
end
