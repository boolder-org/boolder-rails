class AddClusterIdToAreas < ActiveRecord::Migration[7.1]
  def change
    add_column :areas, :cluster_id, :integer
    add_column :areas, :cluster_section, :string

    clusters = [
      { id: 1,  priority: 1, name: "Trois Pignons Est", area_ids: [13,21,26,57,61] },
      { id: 2,  priority: 1, name: "Trois Pignons Ouest", area_ids: [12,16,2,25,28] },
      { id: 2,  priority: 1, name: "Trois Pignons Sud", area_ids: [14,17,18,30,35,54,56,8] },
      { id: 2,  priority: 1, name: "Trois Pignons Nord", area_ids: [10,19,22,27,58,59,71] },
      { id: 2,  priority: 1, name: "Justice de Chambergeot", area_ids: [55] },
      { id: 2,  priority: 1, name: "Gorge aux Chats", area_ids: [15] },
      # { id: 2,  priority: 1, name: "Trois Pignons", area_ids: [10,12,14,15,16,17,18,19,2,22,25,27,28,30,35,54,55,56,58,59,71,8] },
      { id: 3,  priority: 1, name: "Franchard", area_ids: [11,31,34,36,37,38,39,5] },
      { id: 4,  priority: 1, name: "Apremont", area_ids: [104,20,46,48,49,62,63,69,7,99] },
      { id: 5,  priority: 1, name: "Cuvier", area_ids: [4,40,43,44,45,6,64,66,67] },
      { id: 6,  priority: 1, name: "Larchant", area_ids: [41, 42, 9] },
      { id: 7,  priority: 1, name: "Buthiers", area_ids: [23, 77, 78] },
      { id: 8,  priority: 1, name: "Beauvais", area_ids: [29, 80, 81, 82, 83] },
      { id: 9,  priority: 1, name: "Nemours", area_ids: [32,75,84] },
      { id: 10, priority: 2, name: "Restant du Long Rocher", area_ids: [51, 86] },
      { id: 11, priority: 2, name: "Orsay", area_ids: [94, 95] },
      { id: 12, priority: 2, name: "Rocher Canon", area_ids: [1, 47] },
      { id: 13, priority: 2, name: "Rocher Saint Germain", area_ids: [24] },
      { id: 14, priority: 2, name: "Mont Ussy / Calvaire", area_ids: [53, 72, 76, 96] },
      { id: 15, priority: 2, name: "Corne Biche", area_ids: [60] },
      { id: 16, priority: 2, name: "Mont Aigu", area_ids: [73] },
      { id: 17, priority: 2, name: "Rocher d'Avon", area_ids: [50, 70] },
      { id: 18, priority: 2, name: "Bouligny", area_ids: [52] },
      { id: 19, priority: 2, name: "Demoiselles", area_ids: [33] },
      { id: 20, priority: 2, name: "Haute Pierre", area_ids: [91] },
    ]

    clusters.each do |c|
      cluster = Cluster.create!(name: c[:name], priority: c[:priority])
      c[:area_ids].each {|id| Area.find(id).update!(cluster_id: cluster.id) }
    end
  end
end
