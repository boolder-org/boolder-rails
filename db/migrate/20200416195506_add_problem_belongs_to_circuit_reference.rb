class AddProblemBelongsToSectorReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :problems, :sector, index: true
  end
end
