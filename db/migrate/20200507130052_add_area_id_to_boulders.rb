class AddAreaIdToBoulders < ActiveRecord::Migration[6.0]
  def change
    add_reference :boulders, :area, foreign_key: true
  end
end
