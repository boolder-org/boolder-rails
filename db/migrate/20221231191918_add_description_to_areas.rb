class AddDescriptionToAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :description_fr, :text
    add_column :areas, :description_en, :text
  end
end
