class RemoveRiskyOnProblems < ActiveRecord::Migration[7.1]
  def change
    remove_column :problems, :risky
  end
end
