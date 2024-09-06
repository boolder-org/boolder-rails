class AddVariantTypeToProblems < ActiveRecord::Migration[7.1]
  def change
    add_column :problems, :variant_type, :string
    add_column :problems, :variant_parent_id, :integer
    add_index :problems, :variant_type
    add_index :problems, :variant_parent_id
  end
end
