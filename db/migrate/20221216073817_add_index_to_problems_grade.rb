class AddIndexToProblemsGrade < ActiveRecord::Migration[6.1]
  def change
    add_index :problems, :grade
  end
end
