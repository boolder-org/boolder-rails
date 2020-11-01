class AddBleauInfoIdToProblems < ActiveRecord::Migration[6.0]
  def change
  	add_column :problems, :bleau_info_id, :string
  end
end
