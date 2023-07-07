class AddCommentToProblems < ActiveRecord::Migration[7.0]
  def change
    add_column :problems, :comment, :text
    add_column :problems, :action_needed, :boolean, null: true
  end
end
