import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 
    "map", 
    "gradeRadioButton", "gradeMin", "gradeMax", "customGradePicker",
    "filterCounter", "filterIcon" 
  ]
  static values = { 
    token: String,
    bounds: Object,
    problem: Object,
    locale: { type: String, default: 'en' },
    draft: { type: Boolean, default: false },
    problems: String,
  }

  connect() {
    mapboxgl.accessToken = this.tokenValue;

    this.map = new mapboxgl.Map({
      container: 'map',
      language: this.localeValue, // doesn't seem to work?
      locale: this.localeValue == 'fr' ? this.getFrLocale() : null,
      // hash: true,
      style: `mapbox://styles/nmondollot/cl95n147u003k15qry7pvfmq2${this.draftValue ? "/draft" : ""}`,
      bounds: [[2.4806787, 48.2868427],[2.7698927,48.473906]], 
      padding: 5,
    });

    this.addControls()

    this.map.on('load', () => {
      this.addLayers()
      this.centerMap()
      // this.cleanHistory()

      // let grades = ["7a","7a+"]
      // this.applyLayerFilter('problems', grades)
      // this.applyLayerFilter('problems-texts', grades)

      // this.map.setFilter('problems', [
      //   'match',
      //   ['get', 'id'],
      //   [690,3409,2902,8663,3355,3331,245,3283,7813,1455,881,6352,1913,1088,1462,4254,914,1703,1435,8131,4101,6008,5088,5442,3711,6344,1856,1606,11425,1588,14558,230,1739,2555,224,2911,1011,9185,1595,1914,3257,5978,2352,1022,1605,15366,1547,10042,2893,1438,6342,915,3647,2607,8800,1582,10873,2214,3066,7807,2087,2668,243,8680,910,4534,3405,8664,5325,8161,3186,8953,2556,2857,3161,1388,5449,1635,14343,7680,4535,9237,2021,234,555,893,5450,1410,4247,2003,8506,2608,6006,6361,3051,11760,241,3343,1390,1835],
      //   true,
      //   false
      // ]);



    }); // end onload

    this.popup = null
    this.map.on('moveend', () => {
      if(this.popup != null) {
        this.popup.addTo(this.map)
        this.popup = null
      }
    });

    this.setupClickEvents()

    // FIXME: make this DRY (see Problem::GRADE_VALUES)
    this.allGrades = ["1a","1a+","1b","1b+","1c","1c+","2a","2a+","2b","2b+","2c","2c+","3a","3a+","3b","3b+","3c","3c+","4a","4a+","4b","4b+","4c","4c+","5a","5a+","5b","5b+","5c","5c+","6a","6a+","6b","6b+","6c","6c+","7a","7a+","7b","7b+","7c","7c+","8a","8a+","8b","8b+","8c","8c+","9a","9a+","9b","9b+","9c","9c+",]
  }

  addControls() {
    this.map.addControl(
      new mapboxgl.ScaleControl({
        maxWidth: 100,
        unit: 'metric'
       })
    );

    this.map.addControl(
      new mapboxgl.NavigationControl()
    );

    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true
      })
    );
  }

  addLayers() {
    this.map.addSource('problems', {
      type: 'vector',
      url: 'mapbox://nmondollot.4xsv235p',
      promoteId: "id"
    });

    this.map.addSource('top7a', {
      type: 'geojson',
      data: this.problemsValue,
      // cluster: true,
      // clusterMaxZoom: 14, // Max zoom to cluster points on
      // clusterRadius: 50 // Radius of each cluster when clustering points (defaults to 50)
    });

    this.map.addLayer({
      'id': 'problems',
      'type': 'circle',
      'source': 'top7a',
      // 'source-layer': 'problems-ayes3a',
      // 'minzoom': 12,
      'layout': {
        'visibility': 'visible',
        'circle-sort-key': 
          [
            "case",
            ["has", "circuitId"],
            2,
            1
          ]
      },
      'paint': {
        'circle-radius': 
          [
            "interpolate",
            ["linear"],
            ["zoom"],
            12,
            6,
            18,
            10,
          ]
        ,
        'circle-color': "#FFCC02"
        // ,
        // 'circle-opacity': 
        // [
        //   "interpolate",
        //   ["linear"],
        //   ["zoom"],
        //   14.5,
        //   0,
        //   15,
        //   1
        // ]
      },
      filter: [
        "match",
          ["geometry-type"],
          ["Point"],
          true,
          false
      ],
    }
    ,
    "areas" // layer will be inserted just before this layer
    );

    this.map.addLayer({
      'id': 'problems-texts',
      'type': 'symbol',
      'source': 'top7a',
      // 'source-layer': 'problems-ayes3a',
      'minzoom': 14,
      'layout': {
        'visibility': 'visible',
        'text-allow-overlap': true,
        'text-field': [
          "to-string",
          ["get", "name"]
        ],
        'text-size': [
          "interpolate",
          ["linear"],
          ["zoom"],
          19,
          10,
          22,
          20
        ],
        'text-variable-anchor': ["top", "bottom"],
        'text-offset': [0, 1.5],
      },
      'paint': {
        'text-color': "#333",
        'text-halo-color': "hsl(0, 0%, 100%)",
        'text-halo-width': 1,
      },
      filter: [
        "match",
          ["geometry-type"],
          ["Point"],
          true,
          false
      ],
    });
  }

  centerMap() {
    if(this.hasBoundsValue) { 
      let bounds = this.boundsValue

      this.flyToBounds([[bounds.southWestLon, bounds.southWestLat], [bounds.northEastLon, bounds.northEastLat]])
    }

    if(this.hasProblemValue) { 
      let problem = this.problemValue

      this.map.flyTo({
        center: [problem.lon, problem.lat],
        zoom: 20,
        speed: 2
      });

      // FIXME: make it DRY
      const coordinates = [problem.lon, problem.lat];
      var name = problem.name
      if(this.localeValue == 'en' && problem.nameEn) {
        name = problem.nameEn
      }  
      const html = `<a href="/${this.localeValue}/redirects/new?problem_id=${problem.id}" target="_blank">${name || ""}</a><span class="text-gray-400 ml-1">${problem.grade}</span>`;
         
      // will be displayed thanks to the 'moveend' event code above
      this.popup = new mapboxgl.Popup({closeButton:false, focusAfterOpen: false, offset: [0, -8]}) 
        .setLngLat(coordinates)
        .setHTML(html)
    }
  }

  // cleanHistory() {
  //   this.map.on('movestart', () => {
  //     // we remove the arguments (like area_id or problem_id) because mapbox provides a hash (url fragment) to allow for friendly url sharing
  //     // TODO: replace url only when user does something (eg. moves, closes a modal)
  //     history.replaceState({} , '', `/${this.localeValue}/map/top7a`)
  //   });
  // }

  setupClickEvents() {
    this.map.on('mouseenter', 'problems', () => {
      this.map.getCanvas().style.cursor = 'pointer';
    });
    this.map.on('mouseleave', 'problems', () => {
      this.map.getCanvas().style.cursor = '';
    });

    this.map.on('mouseenter', 'problems-texts', () => {
      this.map.getCanvas().style.cursor = 'pointer';
    });
    this.map.on('mouseleave', 'problems-texts', () => {
      this.map.getCanvas().style.cursor = '';
    });

    this.map.on('click', 'problems', (e) => {

      let problem = e.features[0].properties

      // FIXME: make it DRY
      const coordinates = e.features[0].geometry.coordinates.slice();
      var name = problem.name
      if(this.localeValue == 'en' && problem.nameEn) {
        name = problem.nameEn
      }        
      const html = `<a href="/${this.localeValue}/redirects/new?problem_id=${problem.id})" target="_blank">${name || ""}</a><span class="text-gray-400 ml-1">${problem.grade}</span>`;
       
      new mapboxgl.Popup({closeButton:false, focusAfterOpen: false, offset: [0, -8]})
      .setLngLat(coordinates)
      .setHTML(html)
      .addTo(this.map);
    });

    this.map.on('click', 'problems-texts', (e) => {

      let problem = e.features[0].properties

      // FIXME: make it DRY
      const coordinates = e.features[0].geometry.coordinates.slice();
      var name = problem.name
      if(this.localeValue == 'en' && problem.nameEn) {
        name = problem.nameEn
      }        
      const html = `<a href="/${this.localeValue}/redirects/new?problem_id=${problem.id})" target="_blank">${name || ""}</a><span class="text-gray-400 ml-1">${problem.grade}</span>`;
       
      new mapboxgl.Popup({closeButton:false, focusAfterOpen: false, offset: [0, -8]})
      .setLngLat(coordinates)
      .setHTML(html)
      .addTo(this.map);
    });

    // FIXME: make DRY
    this.map.on('mouseenter', 'pois', () => {
      if(this.map.getZoom() >= 12) {
        this.map.getCanvas().style.cursor = 'pointer';
      }
    });
    this.map.on('mouseleave', 'pois', () => {
      if(this.map.getZoom() >= 12) {
        this.map.getCanvas().style.cursor = '';
      }
    });

    this.map.on('click', 'pois', (e) => {
      if(this.map.getZoom() >= 12) {

        // FIXME: make it DRY
        const coordinates = e.features[0].geometry.coordinates.slice();
        const html = `<a href="${e.features[0].properties.googleUrl}" target="_blank">${this.localeValue == 'fr' ? 'Voir sur Google' : 'See on Google'}</a>`;
         
        new mapboxgl.Popup({closeButton:false, focusAfterOpen: false, offset: [0, -8]})
        .setLngLat(coordinates)
        .setHTML(html)
        .addTo(this.map);
      }
    });

    // // FIXME: make DRY
    // this.map.on('mouseenter', 'areas', () => {
    //   if(this.map.getZoom() < 15) {
    //     this.map.getCanvas().style.cursor = 'pointer';
    //   }
    // });
    // this.map.on('mouseleave', 'areas', () => {
    //   if(this.map.getZoom() < 15) {
    //     this.map.getCanvas().style.cursor = '';
    //   }
    // });

    // this.map.on('click', 'areas', (e) => {
    //   if(this.map.getZoom() < 15) {
    //     let props = e.features[0].properties
    //     this.flyToBounds([[props.southWestLon, props.southWestLat], [props.northEastLon, props.northEastLat]])
    //   }
    // });

    //  // FIXME: make DRY
    // this.map.on('mouseenter', 'areas-hulls', () => {
    //   if(this.map.getZoom() < 15) {
    //     this.map.getCanvas().style.cursor = 'pointer';
    //   }
    // });
    // this.map.on('mouseleave', 'areas-hulls', () => {
    //   if(this.map.getZoom() < 15) {
    //     this.map.getCanvas().style.cursor = '';
    //   }
    // });

    // this.map.on('click', 'areas-hulls', (e) => {
    //   if(this.map.getZoom() < 15) {
    //     let props = e.features[0].properties
    //     // console.log(props)
    //     this.flyToBounds([[props.southWestLon, props.southWestLat], [props.northEastLon, props.northEastLat]])
    //   }
    // });

    // // FIXME: make DRY
    // this.map.on('mouseenter', 'clusters', () => {
    //   if(this.map.getZoom() <= 12) {
    //     this.map.getCanvas().style.cursor = 'pointer';
    //   }
    // });
    // this.map.on('mouseleave', 'clusters', () => {
    //   if(this.map.getZoom() <= 12) {
    //     this.map.getCanvas().style.cursor = '';
    //   }
    // });

    // this.map.on('click', 'clusters', (e) => {
    //   if(this.map.getZoom() <= 12) {
    //     let props = e.features[0].properties
    //     this.flyToBounds([[props.southWestLon, props.southWestLat], [props.northEastLon, props.northEastLat]])
    //   }
    // });
  }

  flyToBounds(bounds) {

    var cameraOptions = this.map.cameraForBounds(
      bounds
      , 
      {
        padding: {top: 20, bottom:100, left: 20, right: 20}
      }
    );

    cameraOptions.zoom = Math.max(15, cameraOptions.zoom)
    cameraOptions.speed = 2

    this.map.flyTo(cameraOptions)
  }

  // https://github.com/mapbox/mapbox-gl-js/blob/20e8fd2b60fb751f5846d3be2d46dfa76d940324/src/ui/default_locale.js
  getFrLocale() {
    return {
      'AttributionControl.ToggleAttribution': 'Changer valeur attribution',
      'AttributionControl.MapFeedback': 'Feedback sur la carte',
      'FullscreenControl.Enter': 'Mode plein écran',
      'FullscreenControl.Exit': 'Sortir du mode plein écran',
      'GeolocateControl.FindMyLocation': 'Trouver ma position',
      'GeolocateControl.LocationNotAvailable': 'Localisation non disponible',
      'LogoControl.Title': 'Logo Mapbox',
      'Map.Title': 'Carte',
      'NavigationControl.ResetBearing': 'Remettre au Nord',
      'NavigationControl.ZoomIn': 'Zoomer',
      'NavigationControl.ZoomOut': 'Dézoomer',
      'ScrollZoomBlocker.CtrlMessage': 'Utilisez ctrl + défilement pour zoomer',
      'ScrollZoomBlocker.CmdMessage': 'Utilisez ⌘ + défilement pour zoomer',
      'TouchPanBlocker.Message': 'Utilisez deux doigts pour bouger la carte'
    }
  }

  // =========================================================
  // TODO: move the filters logic into its own controller
  // =========================================================

  didSelectFilter(event) {
    this.gradeRadioButton = event.target.value

    if(this.gradeRadioButton == "custom") {
      this.customGradePickerTarget.classList.remove("hidden")
    }
    else {
      this.customGradePickerTarget.classList.add("hidden")
    }
  }

  applyFilters() {
    this.filterCounterTarget.classList.remove("hidden")
    this.filterIconTarget.classList.add("hidden")

    var grades = []
    if(this.gradeRadioButton == "beginner") {
      grades = ["1a","1a+","1b","1b+","1c","1c+","2a","2a+","2b","2b+","2c","2c+","3a","3a+","3b","3b+","3c","3c+",]
    } 
    else if(this.gradeRadioButton == "level4") {
      grades = ["4a","4a+","4b","4b+","4c","4c+"]
    }
    else if(this.gradeRadioButton == "level5") {
      grades = ["5a","5a+","5b","5b+","5c","5c+"]
    } 
    else if(this.gradeRadioButton == "level6") {
      grades = ["6a","6a+","6b","6b+","6c","6c+"]
    } 
    else if(this.gradeRadioButton == "level7") {
      grades = ["7a","7a+","7b","7b+","7c","7c+"]
    } 
    else if(this.gradeRadioButton == "level8") {
      grades = ["8a","8a+","8b","8b+","8c","8c+"]
    } 
    else if(this.gradeRadioButton == "custom") {
      let gradeMin = this.gradeMinTarget.value
      let gradeMax = this.gradeMaxTarget.value
      grades = this.allGrades.slice(this.allGrades.indexOf(gradeMin), this.allGrades.indexOf(gradeMax) + 2)
    } 
    else {
      grades = this.allGrades
    }

    this.applyLayerFilter('problems', grades)
    this.applyLayerFilter('problems-texts', grades)
  }

  clearFilters() {
    this.gradeRadioButton == null

    this.filterCounterTarget.classList.add("hidden")
    this.filterIconTarget.classList.remove("hidden")

    this.gradeRadioButtonTargets.forEach(item => {
      item.checked = false
    })

    this.applyLayerFilter('problems', this.allGrades)
    this.applyLayerFilter('problems-texts', this.allGrades)
  }

  applyLayerFilter(layer, grades) {
    this.map.setFilter(layer, [
      'match',
      ['get', 'grade'],
      grades,
      true,
      false
    ]);
  }

  didSelectGradeMin() {
    let indexMin = this.allGrades.indexOf(this.gradeMinTarget.value)
    let indexMax = this.allGrades.indexOf(this.gradeMaxTarget.value)
    this.gradeMaxTarget.value = this.allGrades[Math.max(indexMin, indexMax)]
  }

  didSelectGradeMax() {
    let indexMin = this.allGrades.indexOf(this.gradeMinTarget.value)
    let indexMax = this.allGrades.indexOf(this.gradeMaxTarget.value)
    this.gradeMinTarget.value = this.allGrades[Math.min(indexMin, indexMax)]
  }

  // =========================================================


  // =========================================================
  // Hooks coming from search_controller
  // =========================================================

  gotoproblem(event) {
    this.map.flyTo({
      center: [event.detail.lon, event.detail.lat],
      zoom: 20,
      speed: 2
    });

    // FIXME: make it DRY
    const coordinates = [event.detail.lon, event.detail.lat];
    const html = `<a href="/${this.localeValue}/redirects/new?problem_id=${event.detail.id}" target="_blank">${event.detail.name || ""}</a><span class="text-gray-400 ml-1">${event.detail.grade}</span>`;
     
    new mapboxgl.Popup({closeButton:false, focusAfterOpen: false, offset: [0, -8]}) 
    .setLngLat(coordinates)
    .setHTML(html)
    .addTo(this.map);
  }

  gotoarea(event) {
    this.flyToBounds([[event.detail.south_west_lon, event.detail.south_west_lat], [event.detail.north_east_lon, event.detail.north_east_lat]])
  }
}