class CreatePois < ActiveRecord::Migration[6.0]
  def change
    create_table :pois do |t|
      t.string :title
      t.string :subtitle
      t.string :description
      t.st_point :location, geographic: true, srid: 4326
      t.line_string :route, geographic: true, srid: 4326
      t.references :area, index: true

      t.timestamps
    end

    add_index :pois, :location, using: :gist
  end
end
