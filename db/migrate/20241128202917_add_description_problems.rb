class AddDescriptionProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :description, :string
  end
end
