class AddRelatedToBleauProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :bleau_problems, :related_ids, :integer, array: true, default: []
  end
end
