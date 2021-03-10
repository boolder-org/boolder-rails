class AddPublishedToAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :published, :boolean, default: false, index: true, null: false
  end
end
