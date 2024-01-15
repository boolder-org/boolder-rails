class CreateImports < ActiveRecord::Migration[7.1]
  def change
    create_table :imports do |t|
      t.datetime :applied_at
      t.timestamps
    end
  end
end
