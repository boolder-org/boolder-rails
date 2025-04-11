class CreateLineStarts < ActiveRecord::Migration[8.0]
  def change
    create_table :line_starts do |t|
      t.decimal :x
      t.decimal :y
      t.references :topo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
