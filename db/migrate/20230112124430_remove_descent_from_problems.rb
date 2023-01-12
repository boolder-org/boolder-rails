class RemoveDescentFromProblems < ActiveRecord::Migration[6.1]
  def change
    remove_column :problems, :descent
  end
end
