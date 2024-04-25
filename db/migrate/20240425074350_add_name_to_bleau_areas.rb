class AddNameToBleauAreas < ActiveRecord::Migration[7.1]
  def change
    add_column :bleau_areas, :name, :string
    add_column :bleau_areas, :category, :string
  end
end
