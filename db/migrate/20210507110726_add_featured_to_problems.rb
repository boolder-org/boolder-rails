class AddFeaturedToProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :featured, :boolean, default: false, null: false, index: true
  end
end
