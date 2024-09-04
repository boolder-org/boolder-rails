class CreateClusters < ActiveRecord::Migration[7.1]
  def change
    create_table :clusters do |t|
      t.string :name
      t.integer :main_area_id
      t.st_point :center, geographic: true, srid: 4326
      t.st_point :sw, geographic: true, srid: 4326
      t.st_point :ne, geographic: true, srid: 4326
      t.timestamps
    end
  end
end
