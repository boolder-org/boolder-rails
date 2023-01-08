class AddTypeToPois < ActiveRecord::Migration[6.1]
  def change
    add_column :pois, :poi_type, :string, null: false, default: "parking", index: true
  end
end
