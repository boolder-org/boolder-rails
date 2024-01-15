class RemoveProblemTags < ActiveRecord::Migration[7.1]
  def change
    remove_column :problems, :tags
  end
end
