class DropCircuitsAreaId < ActiveRecord::Migration[6.1]
  def change
    remove_column :circuits, :area_id
  end
end
