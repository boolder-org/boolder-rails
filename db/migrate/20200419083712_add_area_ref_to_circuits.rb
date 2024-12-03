class AddAreaRefToSectors < ActiveRecord::Migration[6.0]
  def change
    add_reference :sectors, :area, foreign_key: true
  end
end
