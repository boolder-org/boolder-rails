class AddPoiToAreas < ActiveRecord::Migration[6.1]
  def change
    add_reference :areas, :poi, foreign_key: true
    add_column :areas, :poi_distance, :integer
  end
end
