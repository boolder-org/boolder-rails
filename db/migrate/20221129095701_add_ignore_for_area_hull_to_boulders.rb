class AddIgnoreForAreaHullToBoulders < ActiveRecord::Migration[6.1]
  def change
    add_column :boulders, :ignore_for_area_hull, :boolean, default: false, null: false, index: true
  end
end
