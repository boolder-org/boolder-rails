class AddRatingToProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :rating, :integer, index: true
  end
end
