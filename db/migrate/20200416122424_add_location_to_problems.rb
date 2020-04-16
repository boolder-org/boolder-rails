class AddLocationToProblems < ActiveRecord::Migration[6.0]
  def change
    # other types: point, polygon, line_string, geometry_collection, multi_line_string, multi_point, multi_polygon
    # using srid 4326 (WGS84) for GPS coordinates
    add_column :problems, :location, :st_point, geographic: true, srid: 4326

    add_index :problems, :location, using: :gist
  end
end
