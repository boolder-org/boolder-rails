class AddIgnoreToBleauProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :bleau_problems, :ignore, :boolean, default: false
  end
end
