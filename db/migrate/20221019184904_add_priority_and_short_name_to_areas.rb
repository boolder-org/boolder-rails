class AddPriorityAndShortNameToAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :short_name, :string
    add_column :areas, :priority, :integer, limit: 1, null: false, default: 3
  end
end
