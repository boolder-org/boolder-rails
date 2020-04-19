class AddAreaRefToCircuits < ActiveRecord::Migration[6.0]
  def change
    add_reference :circuits, :area, foreign_key: true
  end
end
