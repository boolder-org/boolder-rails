class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string :name
      t.string :grade

      t.timestamps
    end
  end
end
