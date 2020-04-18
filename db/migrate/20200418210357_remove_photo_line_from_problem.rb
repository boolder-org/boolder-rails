class RemovePhotoLineFromProblem < ActiveRecord::Migration[6.0]
  def change
    remove_column :problems, :photo_line, :json
  end
end
