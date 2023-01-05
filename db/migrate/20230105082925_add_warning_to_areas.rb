class AddWarningToAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :warning_fr, :text
    add_column :areas, :warning_en, :text
  end
end
