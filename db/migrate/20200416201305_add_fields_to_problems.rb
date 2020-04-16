class AddFieldsToProblems < ActiveRecord::Migration[6.0]
  def change
    change_table :problems do |t|
      t.string :steepness
      t.integer :height
      t.json :photo_line
    end
  end
end
