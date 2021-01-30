class AddWalkingTimeAndGoogleUrlToPois < ActiveRecord::Migration[6.1]
  def change
  	add_column :pois, :walk_time, :integer
  	add_column :pois, :google_url, :string
  end
end
