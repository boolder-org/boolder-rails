class AddHasLineToProblems < ActiveRecord::Migration[7.1]
  def up
    add_column :problems, :has_line, :boolean, null: false, default: false
    add_index :problems, :has_line

    # Problem.find_each do |problem|
    #   problem.update(has_line: problem.compute_has_line)
    # end
  end

  def down
    remove_column :problems, :has_line
  end
end
