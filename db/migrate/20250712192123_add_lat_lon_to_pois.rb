class AddLatLonToPois < ActiveRecord::Migration[8.0]
  def change
    add_column :pois, :location, :st_point, geographic: true, srid: 4326
  end
end
