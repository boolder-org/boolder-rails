class AddClusterToAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :cluster, :string
  end
end
