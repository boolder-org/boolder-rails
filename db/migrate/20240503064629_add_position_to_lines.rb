class AddPositionToLines < ActiveRecord::Migration[7.1]
  def up
    add_column :lines, :position, :integer
    
    Problem.all.find_each do |problem|
      problem.lines.reorder(created_at: :asc).each_with_index do |line, index|
        puts "updating line ##{line.id}"
        line.update_columns(position: index+1)
      end
    end

    change_column_null :lines, :position, false
    add_index :lines, [:problem_id, :position], unique: true
  end

  def down
    remove_column :lines, :position
  end
end
