class AddAreaIdToBleauAreas < ActiveRecord::Migration[7.0]
  def up
    add_column :areas, :bleau_area_id, :integer

    slugs = {
      'rocher-canon' => 'canon',
      'cul-de-chien' => 'cul',
      'cuvier' => 'cuvier',
      'franchard-isatis' => 'isatis',
      'cuvier-est' => 'cuvierest',
      'apremont' => 'apremont',
      'rocher-fin' => 'fin',
      'elephant' => 'elephant',
      '95-2' => '95.2',
      'franchard-cuisiniere' => 'cuisiniere',
      'roche-aux-sabots' => 'sabots',
      'canche-aux-merciers' => 'canche',
      'rocher-du-potala' => 'mee',
      'gorge-aux-chats' => 'chats',
      '91-1' => '91.1',
      'rocher-guichot' => 'guichot',
      'diplodocus' => 'diplodocus',
      'rocher-des-potets' => 'potets',
      'apremont-ouest' => 'apremontouest',
      'bois-rond' => 'rond',
      'rocher-des-souris' => 'souris',
      'buthiers' => 'y',
      'rocher-saint-germain' => 'germainest',
      'roche-aux-oiseaux' => 'oiseaux',
      'drei-zinnen' => 'zinnen',
      'jean-des-vignes' => 'jean',
      'la-segognole' => 'segognole',
      'beauvais-nainville' => 'beauvais',
      'ja-martin' => 'martin',
      'cuisiniere-cretes-sud' => 'cretesud',
      'petit-bois' => 'petit',
      'rocher-demoiselles' => 'demoiselles',
      'franchard-sablons' => 'sablons',
      'rocher-cathedrale' => 'cathedrale',
      'franchard-hautes-plaines' => 'plaines',
      'franchard-meyer' => 'meyer',
      'franchard-sablons-carriers' => 'franchardcarriers',
      'franchard-raymond' => 'raymond',
      'cuvier-merveille' => 'merveille',
      'maunoury' => 'maunoury',
      'dame-jouanne' => 'jouanne',
      'cuvier-ouest' => 'cuvierouest',
      'cuvier-nord' => 'cuvier.nord',
      'cuvier-bellevue' => 'bellevue',
      'apremont-bizons' => 'bizons',
      'rocher-canon-ouest' => 'canonouest',
      'apremont-butte-aux-dames' => 'butteauxdames',
      'apremont-solitude' => 'solitude',
      'rocher-avon' => 'avon',
      'restant-long-rocher' => 'restant', # split in 2?
      'rocher-bouligny' => 'bouligny',
      'mont-ussy' => 'ussy',
      'rocher-du-general' => 'general',
      'justice-chambergeot' => 'chambergeot',
      'grande-montagne' => 'grandemontagne',
      'telegraphe' => 'telegraphe2',
      'pignon-poteau' => 'poteau',
      'gros-sablons' => 'gros',
      'corne-biche' => 'cornebiche',
      'rocher-de-la-reine' => 'reine',
      'apremont-envers' => 'envers',
      'apremont-desert' => 'desert',
      'cuvier-rempart' => 'rempart',
      'petit-rempart' => 'petitrempart',
      'reconnaissance' => 'reconnaissance',
      'restant-long-rocher-nord' => 'grottebeatrix',
      'apremont-est' => 'apremontest',
      'rocher-avon-est' => 'avonest',
      'gros-sablons-nord' => 'cassis',
      'calvaire' => 'calvaire',
      'mont-aigu' => 'aigu',
      'mont-aigu-ouest' => 'aigu', # not used
      'rocher-greau' => 'greau',
      'roche-hercule' => 'hercule',
      'buthiers-tennis' => 'tennis',
      'buthiers-canard' => 'canard',
      'coquibus-rumont' => 'coquibus',
      'beauvais-telegraphe' => 'telegraphe',
      'beauvais-loutteville' => 'loutteville',
      'beauvais-roches-noires' => 'rochesnoires',
      'beauvais-hameau' => 'hameau',
      'puiselet-mont-sarrasin' => 'sarrazin',
      'long-boyau' => 'longboyau',
    }

    slugs.each do |slug, slug_bleau| 
      area = Area.find_by(slug: slug)
      bleau_area = BleauArea.find_by(slug: slug_bleau)
      area.update!(bleau_area_id: bleau_area.id)
    end

    change_column_null(:areas, :bleau_area_id, false)
  end

  def down
    remove_column :areas, :bleau_area_id
  end
end
