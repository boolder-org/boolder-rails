class CreateImports < ActiveRecord::Migration[7.1]
  def change
    create_table :imports do |t|
      t.boolean :processed, null: false, default: false
      t.timestamps
    end
  end
end
