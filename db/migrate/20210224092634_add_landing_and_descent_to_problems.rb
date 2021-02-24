class AddLandingAndDescentToProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :landing, :string
    add_column :problems, :descent, :string
  end
end
