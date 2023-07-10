class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :reason, index: true, null: false
      t.string :state, index: true, null: false
      t.references :problem
      t.timestamps
    end
  end
end
