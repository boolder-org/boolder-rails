# require "HTTParty"
require 'csv'

namespace :bleau do
  task photo_urls: :environment do
    # area_id = ENV["area_id"]
    # raise "please specify an area_id" unless area_id.present?

    CSV.open("export/bleau_photos.csv", "w") do |csv|

      csv << %w(area id name grade circuit number url bleau_id bleau_url photo)

      Problem.joins(:area).where(area: { published: true }).map do |p|  
        photo = p.lines.first&.topo&.photo

        csv << [
          p.area.name,
          p.id, 
          p.name, 
          p.grade, 
          p.circuit.present? ? p.circuit.color : "",
          [p.circuit_number, p.circuit_letter].join(""),
          "https://www.boolder.com/en/fontainebleau/rocher-fin/#{p.id}",
          p.bleau_info_id,
          p.bleau_info_id.present? ? "https://bleau.info/c/#{p.bleau_info_id}.html" : "",
          photo ? url_for(photo.variant(resize_to_limit: [1200, 1200], quality: 50)) : ""
        ]
      end
    end

    puts "exported bleau_photos.csv".green
  end

  task import: :environment do
    slugs = ["cuvier","bellevue","campchailly","cuvierest","merveille","cuvier.nord","cuvierouest","rempart","sorcieres","piat","reconnaissance","montsetmerveilles","petitrempart","apremont","Apremontbelvedere","bizons","brulis","butteauxdames","butteauxpeintres","buvette","desert","envers","apremontest","fondgorges","hautdesgorges","biches","marietherese","apremontouest","portesdesert","apremontsanglier","solitude","apremontsully","cuisiniere","carnage","cretesud","bassesplaines","druides","ermitage","plaines","hautssablons","isatis","meyer","franchardpointdevue","raymond","sablons","franchardcarriers","sablons110","merisiers","houx","oiseauxdeproie","oiseauxproienord","petitparadis","renard","longboyau","aigu","cassepotgrises","cassepotoranges","cassepotroses","seineport","calvaire","calvaireest","petitmont","montchauvet","ussy","montussyest","hercule","canon","canonouest","germainest","germain","denecourt","guette","marecorneilles","marion","reclosescretes","recloses","restant","longrocherest","grottebeatrix","longrochergrandesvallees","restantsud","besnard","rocherbrule","avon","avonest","avonouest","bouligny","boulignyest","combe","occidentale","salamandreest","demoiselles","demoisellesest","demoisellessud","etroitures","princes","ventesheron","passage","montmorillon","fourceau","villecerf","beauregard","chaintreauville","darvault","fosse","troglodyte","mammouths","olivet","glandelles","petit","pierrelesault","puiseletimpasse","puiselet","sarrazin","sablibum","greau","pyrenees","cassepot","blomont","hyver","jouanne","elephant","boutdumonde","elephantnord","ouest","bernard","pentesmarchais","maunoury","montblancouest","montblanc","simonet","simonetouest","diable","argeville","boigneville","cailles","champlaid","chateaurenard","LeGoulot","leplaid","norgevaux","valleeeglise","canard","buthiersnord","y","tennis","marlanval","roisneau","villetard","91.1","95.2","95.2ouest","chateauveau","cul","chats","chatsnord","chatsouest","gros","cassis","jean","chambergeot","justicenoisy","segognole","pivot","poteau","four","oiseaux","sabots","sabotsest","zen","potets","souris","guetteur","hautsmilly","diplodocus","grandemontagne","martin","111","cailleau","cathedrale","tortue","general","mee","fin","guichot","boisdurocher","rond","boisrondauberge","moine","canche","anarchodrome","zinnen","beorlots","beorlotsnord","beorlotsouest","cornebiche","petitereine","reine","cretenord","milly","millyest","mariniers","telegraphe2","touche","valleechaude","charme","valleeronde","arcades","auvergne","grandesvallees","longsvaux","rochefeuilletee","coquibus","vendee","courances","coquibuswest","guichet","joncs","montignotte","montrougetouest","montrouget","rochequitourne","voleurs","ancetres","guinguette","hameau","loutteville","beauvais","rochesnoires","beauvaisest","telegraphe","charbonniere","valette","cheminroyal","hautepierre","grotteauxfees","padole","centmarches","moigny","noisy","oncynord","oncy","videlles_abbatoir","videlles","aiguille","ballancourt","montgriffard","boissylecutte","chamarande","belvedere","gillevoisin","croubis","champs","etampes","etrechy","buttesaintmartin","rocheplate","fertealais","pendu","sanglier","comble","maisse","mondevillecapavance","mondeville","mondevillerocheauxdames","billard","chatillon","mignot","prunay","valpuiseaux","villeneuve","maincourt","troche","vauxdecernay","orsay","merantais","angennes","saintremy"]

    Parallel.each(slugs) do |slug| 
      puts "processing #{slug}"

      html = HTTParty.get("https://bleau.info/#{slug}").body
      doc = Nokogiri::HTML(html)

      bleau_problems = doc.css(".vsr").map do |row|
        a = row.css("a").first
        link = a.attributes["href"].value
        id = link[/([\w-]+).html/,1]
        grade = row.children.map { |e| e.text if e.text? }.join.strip
        OpenStruct.new(bleau_info_id: id, name: a.text, grade: grade)
      end

      CSV.open("export/bleau/#{slug}.csv", "w") do |csv|
        csv << ["slug", "bleau_info_id", "name", "grade", "ascents", "id"]
        bleau_problems.each do |bleau_problem|
          id = Problem.where(bleau_info_id: bleau_problem.bleau_info_id).first&.id
          csv << [slug, bleau_problem.bleau_info_id, bleau_problem.name, bleau_problem.grade, ascents(bleau_problem.bleau_info_id), id]
        end
      end
    end
  end

  task concat: :environment do
    CSV.open("export/problems.csv", "wb", write_headers: true, headers: ["slug", "bleau_info_id", "name", "grade", "ascents", "id"]) do |csv|
      Dir["export/bleau/*.csv"].each do |path|  
        CSV.foreach(path, headers: true, return_headers: false) do |row| # don't output the headers in the rows
          csv << row
        end
      end
    end
  end
end

def ascents(bleau_info_id)
  puts "getting ascents for bleau_info_id #{bleau_info_id}"
  html = HTTParty.get("https://bleau.info/c/#{bleau_info_id}.html?locale=en").body
  doc = Nokogiri::HTML(html)

  # ratings_text = doc.css(".bdetails .bopins")[0]&.text || ""
  ascents_text = doc.css(".bdetails .bopins")[2]&.text || ""

  # ratings_average = ratings_text.match(/([0-9]\.[0-9]) Stars/)&.[](1)
  # ratings_number = ratings_text.match(/([0-9]+) total/)&.[](1)
  ascents_number = ascents_text.match(/([0-9]+) total/)&.[](1)

  ascents_number.to_i

rescue
  nil
end