class AddPoiRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :poi_routes do |t|
      t.integer :distance, null: false
      t.string :transport, null: false
      t.references :area, index: true
      t.references :poi, index: true
      t.timestamps
    end
  end
end
