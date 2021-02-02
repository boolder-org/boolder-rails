class Postgis < ActiveRecord::Migration[6.1]
  def change
  	enable_extension :postgis
  end
end
