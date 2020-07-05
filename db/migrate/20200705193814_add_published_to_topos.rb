class AddPublishedToTopos < ActiveRecord::Migration[6.0]
  def change
    add_column :topos, :published, :boolean, default: true, index: true, null: false
  end
end
