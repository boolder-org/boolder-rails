class CreateContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :contributions do |t|
      t.references :problem, index: true
      t.text :comment
      t.geography :location, geographic: true, type: "st_point", srid: 4326
      t.timestamps
    end
  end
end
