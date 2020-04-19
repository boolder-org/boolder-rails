class AddAreaRefToProblems < ActiveRecord::Migration[6.0]
  def change
    add_reference :problems, :area, foreign_key: true
  end
end
