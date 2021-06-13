class AddTagsToAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :tags, :string, array: true, default: [], null: false
    add_index :areas, :tags, using: 'gin'
  end
end
