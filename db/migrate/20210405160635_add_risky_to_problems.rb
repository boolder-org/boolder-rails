class AddRiskyToProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :risky, :boolean, default: false, null: false
  end
end
