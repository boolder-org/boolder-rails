class CreateBleauProblems < ActiveRecord::Migration[7.0]
  def change
    create_table :bleau_problems do |t|
      t.string :name
      t.string :grade
      t.string :steepness
      t.boolean :sit_start
      t.string :tags, array: true, default: [], null: false
      t.references :bleau_circuit, index: true
      t.string :circuit_number
      t.string :circuit_letter
      t.integer :ascents
      t.integer :ratings
      t.decimal :ratings_average
      t.references :bleau_area, index: true
      t.timestamps
    end
  end
end
