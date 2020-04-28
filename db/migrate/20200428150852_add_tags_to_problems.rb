class AddTagsToProblems < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :tags, :string, array: true, default: [], null: false
    add_index :problems, :tags, using: 'gin'
  end
end
