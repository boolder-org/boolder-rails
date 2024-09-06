class AddCanonicalNameToProblems < ActiveRecord::Migration[7.1]
  def change
    add_column :problems, :name_canonical, :string
    add_column :problems, :name_suffix, :string
    add_index :problems, :name_canonical
    add_index :problems, :name_suffix
  end
end
