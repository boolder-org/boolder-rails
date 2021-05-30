class AddSlugToAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :slug, :string
    add_index :areas, :slug, unique: true

    # Area.all.each{|a| a.update(slug: a.name.parameterize)}
  end
end
