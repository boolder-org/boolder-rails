class AddClusterIdToAreas < ActiveRecord::Migration[7.1]
  def change
    add_column :areas, :cluster_id, :integer
    add_column :areas, :cluster_section, :string

    clusters = [
      { name: "Trois Pignons Est", area_ids: [13,21,26,57,61], main_area_id: 26 },
      { name: "Trois Pignons Ouest", area_ids: [12,16,2,25,28], main_area_id: 16 },
      { name: "Trois Pignons Sud", area_ids: [14,17,18,30,35,54,56,8], main_area_id: 17 },
      { name: "Trois Pignons Nord", area_ids: [10,19,22,27,58,59,71,15,55], main_area_id: 10 },
      # name: "Justice de Chambergeot", area_ids: [55], main_area_id: },
      # name: "Gorge aux Chats", area_ids: [15], main_area_id: },
      # name: "Trois Pignons", area_ids: [10,12,14,15,16,17,18,19,2,22,25,27,28,30,35,54,55,56,58,59,71,8], main_area_id: },
      { name: "Franchard", area_ids: [11,31,34,36,37,38,39,5], main_area_id: 5 },
      { name: "Apremont", area_ids: [104,20,46,48,49,62,63,69,7,99], main_area_id: 7 },
      { name: "Cuvier", area_ids: [4,40,43,44,45,6,64,66,67], main_area_id: 4 },
      { name: "Larchant", area_ids: [41, 42, 9], main_area_id: 9 },
      { name: "Buthiers", area_ids: [23, 77, 78], main_area_id: 23 },
      { name: "Beauvais", area_ids: [29, 80, 81, 82, 83], main_area_id: 29 },
      { name: "Nemours", area_ids: [32,75,84], main_area_id: 32 },
      { name: "Restant du Long Rocher", area_ids: [51, 86], main_area_id: 51 },
      { name: "Orsay", area_ids: [94, 95], main_area_id: 94 },
      { name: "Rocher Canon", area_ids: [1, 47], main_area_id: 1 },
      { name: "Rocher Saint Germain", area_ids: [24], main_area_id: 24 },
      { name: "Mont Ussy / Calvaire", area_ids: [53, 72, 76, 96], main_area_id: 72 },
      { name: "Corne Biche", area_ids: [60], main_area_id: 60 },
      { name: "Mont Aigu", area_ids: [73], main_area_id: 73 },
      { name: "Rocher d'Avon", area_ids: [50, 70], main_area_id: 50 },
      { name: "Bouligny", area_ids: [52], main_area_id: 52 },
      { name: "Demoiselles", area_ids: [33], main_area_id: 53 },
      { name: "Haute Pierre", area_ids: [91], main_area_id: 91},
    ]

    clusters.each do |c|
      cluster = Cluster.create!(name: c[:name], main_area_id: c[:main_area_id])
      c[:area_ids].each {|id| Area.find(id).update!(cluster_id: cluster.id) }
    end
  end
end
