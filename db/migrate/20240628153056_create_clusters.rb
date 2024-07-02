class CreateClusters < ActiveRecord::Migration[7.1]
  def change
    create_table :clusters do |t|
      t.string :name
      t.integer :main_area_id
      t.timestamps
    end
  end
end
