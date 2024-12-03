class DropSectorsAreaId < ActiveRecord::Migration[6.1]
  def change
    remove_column :sectors, :area_id
  end
end
