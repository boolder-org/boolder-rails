class AddSectorLetterToProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :sector_letter, :string
  end
end
