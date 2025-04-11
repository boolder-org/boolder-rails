class AddStartToLines < ActiveRecord::Migration[8.0]
  def change
    add_reference :lines, :start, foreign_key: { to_table: :line_starts }
  end
end
