class RemovePoiFromAreas < ActiveRecord::Migration[6.1]
  def change
    remove_column :areas, :poi_id
    remove_column :areas, :poi_distance
  end
end
