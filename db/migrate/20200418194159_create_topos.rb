class CreateTopos < ActiveRecord::Migration[6.0]
  def change
    create_table :topos do |t|
      t.json :line
      t.references :problem, index: true

      t.timestamps
    end
  end
end
