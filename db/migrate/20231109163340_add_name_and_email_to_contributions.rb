class AddNameAndEmailToContributions < ActiveRecord::Migration[7.0]
  def change
    add_column :contributions, :name, :string
    add_column :contributions, :email, :string
  end
end
