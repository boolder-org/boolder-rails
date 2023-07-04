class ChangeBleauInfoIdToInt < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE problems
      SET bleau_info_id = NULL
      WHERE bleau_info_id = '';
    SQL

    change_column :problems, :bleau_info_id, 'integer USING CAST(bleau_info_id AS integer)'
  end

  def down
    change_column :problems, :bleau_info_id, :string
  end
end
