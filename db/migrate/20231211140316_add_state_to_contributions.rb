class AddStateToContributions < ActiveRecord::Migration[7.0]
  def change
    add_column :contributions, :state, :string, index: true, null: false, default: "pending"
  end
end
