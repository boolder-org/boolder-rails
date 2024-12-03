class AddSectorNumberToProblems < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :sector_number, :string
  end
end
