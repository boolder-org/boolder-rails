class RenameContributionName < ActiveRecord::Migration[7.0]
  def change
    rename_column :contributions, :name, :contributor_name
    rename_column :contributions, :email, :contributor_email
  end
end
