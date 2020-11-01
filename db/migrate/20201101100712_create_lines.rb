class CreateLines < ActiveRecord::Migration[6.0]
  def up
    create_table :lines do |t|
      t.json :coordinates
      t.references :problem, index: true
      t.references :topo, index: true

      t.timestamps
    end

	  Topo.unscoped.all.where("line IS NOT NULL").each do |topo|
			line = Line.create(coordinates: topo.line, problem_id: topo.problem_id, topo_id: topo.id)
		end
  end

  def down
  	drop_table :lines
  end
end
