class AddClusterIdToAreas < ActiveRecord::Migration[7.1]
  def change
    add_column :areas, :cluster_id, :integer

    # clusters = [
    #   { 
    #     name: "Trois Pignons", 
    #     area_ids: [12,16,2,25,28,14,17,18,30,35,54,56,8,10,19,22,27,58,59,71,15,55,13,21,26,57,61], 
    #     main_area_id: 2,
    #     center: "POINT(2.5298686 48.3794617)",
    #     sw: "POINT(2.5083128 48.3586603)",
    #     ne: "POINT(2.548881 48.3953245)"
    #   },
    #   { 
    #     name: "Franchard", 
    #     area_ids: [11,31,34,36,37,38,39,5], 
    #     main_area_id: 5,
    #     center: "POINT(2.6021719 48.4090354)",
    #     sw: "POINT(2.5947046 48.4071053)",
    #     ne: "POINT(2.6145744 48.4109511)"
    #   },
    #   { 
    #     name: "Apremont", 
    #     area_ids: [104,20,46,48,49,62,63,69,7,99], 
    #     main_area_id: 7,
    #     center: "POINT(2.627685 48.4371021)",
    #     sw: "POINT(2.6195097 48.4336142)",
    #     ne: "POINT(2.6357746 48.4406325)"
    #   },
    #   { 
    #     name: "Cuvier", 
    #     area_ids: [4,40,43,44,45,6,64,66,67], 
    #     main_area_id: 4,
    #     center: "POINT(2.6402807 48.4468243)",
    #     sw: "POINT(2.6327276 48.4446751)",
    #     ne: "POINT(2.6508808 48.4493008)"
    #   },
    #   { name: "Larchant", area_ids: [41, 42, 9], main_area_id: 9 },
    #   { name: "Buthiers", area_ids: [23, 77, 78], main_area_id: 23 },
    #   { name: "Beauvais", area_ids: [29, 80, 81, 82, 83], main_area_id: 29 },
    #   { name: "Nemours", area_ids: [32,75,84, 92, 101], main_area_id: 32 },
    #   { name: "Restant du Long Rocher", area_ids: [51, 86], main_area_id: 51 },
    #   { name: "Orsay", area_ids: [94, 95], main_area_id: 94 },
    #   { name: "Rocher Canon", area_ids: [1, 47], main_area_id: 1 },
    #   { name: "Rocher Saint Germain", area_ids: [24], main_area_id: 24 },
    #   { name: "Mont Ussy / Calvaire", area_ids: [53, 72, 76, 96], main_area_id: 72 },
    #   { name: "Corne Biche", area_ids: [60], main_area_id: 60 },
    #   { name: "Mont Aigu", area_ids: [73], main_area_id: 73 },
    #   { name: "Rocher d'Avon", area_ids: [50, 70], main_area_id: 50 },
    #   { name: "Bouligny", area_ids: [52], main_area_id: 52 },
    #   { name: "Demoiselles", area_ids: [33], main_area_id: 53 },
    #   { name: "Haute Pierre", area_ids: [91], main_area_id: 91},
    # ]

    # clusters.each do |c|
    #   cluster = Cluster.create!(name: c[:name], main_area_id: c[:main_area_id])
    #   c[:area_ids].each {|id| Area.find(id).update!(cluster_id: cluster.id) }

    #   if c[:sw] && c[:ne] && c[:center]
    #     cluster.update!(sw: c[:sw], ne: c[:ne], center: c[:center])
    #   end
    # end
  end
end
