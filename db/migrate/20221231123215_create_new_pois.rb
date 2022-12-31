class CreateNewPois < ActiveRecord::Migration[6.1]
  def change
    create_table :pois do |t|
      t.string :name
      t.string :short_name
      t.string :google_url
      t.timestamps
    end
  end
end
