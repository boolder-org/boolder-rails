class AddSitStartToProblems < ActiveRecord::Migration[7.1]
  def up
    add_column :problems, :sit_start, :boolean, null: false, default: false

    Problem.where("tags && ARRAY[?]::varchar[]", "sit_start").update_all(sit_start: true)
  end

  def down
    remove_column :problems, :sit_start
  end
end
