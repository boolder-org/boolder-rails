class AddMetaDataToTopos < ActiveRecord::Migration[6.0]
  def change
  	add_column :topos, :metadata, :json
  end
end
