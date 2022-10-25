import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "map", "grade", "gradeMin", "gradeMax", "customGradeFilter" ]
  static values = { 
    bounds: Object,
    problem: Object,
    locale: { type: String, default: 'en' },
    draft: { type: Boolean, default: false },
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

  clearFilters() {
    this.gradeTargets.forEach(item => {
      item.checked = false
    })

    this.map.setFilter('problems', [
      'match',
      ['get', 'grade'],
      this.allGrades,
      true,
      false
    ]);

    this.map.setFilter('problems-texts', [
      'match',
      ['get', 'grade'],
      this.allGrades,
      true,
      false
    ]);
  }

  updateFilters() {
    var grades = []
    if(this.gradeFilter == "beginner") {
      grades = ["1a","1a+","1b","1b+","1c","1c+","2a","2a+","2b","2b+","2c","2c+","3a","3a+","3b","3b+","3c","3c+",]
    } 
    else if(this.gradeFilter == "intermediate") {
      grades = ["4a","4a+","4b","4b+","4c","4c+", "5a","5a+","5b","5b+","5c","5c+",]
    } 
    else if(this.gradeFilter == "advanced") {
      grades = ["6a","6a+","6b","6b+","6c","6c+","7a","7a+","7b","7b+","7c","7c+","8a","8a+","8b","8b+","8c","8c+","9a","9a+","9b","9b+","9c","9c+",]
    } 
    else if(this.gradeFilter == "custom") {
      let gradeMin = this.gradeMinTarget.value
      let gradeMax = this.gradeMaxTarget.value
      grades = this.allGrades.slice(this.allGrades.indexOf(gradeMin), this.allGrades.indexOf(gradeMax) + 2)
    } 
    else {
      grades = this.allGrades
    }

    this.map.setFilter('problems', [
      'match',
      ['get', 'grade'],
      grades,
      true,
      false
    ]);

    this.map.setFilter('problems-texts', [
      'match',
      ['get', 'grade'],
      grades,
      true,
      false
    ]);
  }

  didSelectFilter(event) {
    this.gradeFilter = event.target.value

    if(this.gradeFilter == "custom") {
      this.customGradeFilterTarget.classList.remove("hidden")
    }
     else {
      this.customGradeFilterTarget.classList.add("hidden")
     }
    // console.log(this.gradeFilter)
  }

  connect() {
    // mapboxgl.accessToken = 'pk.eyJ1Ijoibm1vbmRvbGxvdCIsImEiOiJja2hwMXMzZWgwcndhMnJrOHY1a3c0eHE5In0.F4P_5ZCsauDFiSqrxqjZ8w';

    this.map = new mapboxgl.Map({
      container: 'map',
      language: this.localeValue, // doesn't seem to work?
      locale: this.localeValue == 'fr' ? this.getFrLocale() : null,
      hash: true,
      style: `mapbox://styles/nmondollot/cl95n147u003k15qry7pvfmq2${this.draftValue ? "/draft" : ""}`,
      bounds: [[2.4806787, 48.2868427],[2.7698927,48.473906]], 
      padding: 5,
    });

    this.addControls()

    this.map.on('load', () => {
      this.addLayers()
      this.centerMap()
      this.cleanHistory()
    });

    this.popup = null
    this.map.on('moveend', () => {
      if(this.popup != null) {
        this.popup.addTo(this.map)
        this.popup = null
      }
    });

    this.setupClickEvents()

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
      url: 'mapbox://nmondollot.4xsv235p' 
    });

    this.map.addLayer({
      'id': 'problems',
      'type': 'circle',
      'source': 'problems',
      'source-layer': 'problems-ayes3a',
      'minzoom': 15,
      'layout': {
        'visibility': 'visible'
      },
      'paint': {
        'circle-radius': 
          [
            "interpolate",
            ["linear"],
            ["zoom"],
            15,
            2,
            18,
            4,
            22,
            [
              "case",
              ["has", "circuitId"],
              16,
              10
            ]
          ]
        ,
        'circle-color':  // FIXME: make it DRY  
          [
            "case",
            [
              "match",
              ["get", "circuitColor"],
              ["", "yellow"],
              true,
              false
            ],
            "#FFCC02",
            [
              "match",
              ["get", "circuitColor"],
              ["", "purple"],
              true,
              false
            ],
            "#D783FF",
            [
              "match",
              ["get", "circuitColor"],
              ["", "orange"],
              true,
              false
            ],
            "#FF9500",
            [
              "match",
              ["get", "circuitColor"],
              ["", "green"],
              true,
              false
            ],
            "#77C344",
            [
              "match",
              ["get", "circuitColor"],
              ["", "blue"],
              true,
              false
            ],
            "#017AFF",
            [
              "match",
              ["get", "circuitColor"],
              ["", "skyblue"],
              true,
              false
            ],
            "#5AC7FA",
            [
              "match",
              ["get", "circuitColor"],
              ["", "salmon"],
              true,
              false
            ],
            "#FDAF8A",
            [
              "match",
              ["get", "circuitColor"],
              ["", "red"],
              true,
              false
            ],
            "#FF3B2F",
            [
              "match",
              ["get", "circuitColor"],
              ["", "black"],
              true,
              false
            ],
            "#000",
            [
              "match",
              ["get", "circuitColor"],
              ["", "white"],
              true,
              false
            ],
            "#FFFFFF",
            "#878A8D"
          ]
        ,
        'circle-opacity': 
        [
          "interpolate",
          ["linear"],
          ["zoom"],
          14.5,
          0,
          15,
          1
        ]
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
      'source': 'problems',
      'source-layer': 'problems-ayes3a',
      'minzoom': 19,
      'layout': {
        'visibility': 'visible',
        'text-allow-overlap': true,
        'text-field': [
          "to-string",
          ["get", "circuitNumber"]
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
      },
      'paint': {
        'text-color': 
          [
            "case",
            [
              "match",
              ["get", "circuitColor"],
              ["", "white"],
              true,
              false
            ],
            "#333",
            "#fff",
          ]
        ,
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

      this.map.fitBounds(
        [
          [bounds.southWestLon, bounds.southWestLat], // southwestern corner of the bounds
          [bounds.northEastLon, bounds.northEastLat] // northeastern corner of the bounds
        ], 
        {
          animate: true,
          padding: 50 // careful: may trigger an error on mobile devices "Map cannot fit within canvas with the given bounds, padding, and/or offset."
        }
      );
    }

    if(this.hasProblemValue) { 
      let problem = this.problemValue

      this.map.flyTo({
        center: [problem.lon, problem.lat],
        zoom: 20,
        speed: 4,
        curve: 1,
        easing(t) {
          return t;
        }
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

  cleanHistory() {
    this.map.on('movestart', () => {
      // we remove the arguments (like area_id or problem_id) because mapbox provides a hash (url fragment) to allow for friendly url sharing
      // TODO: replace url only when user does something (eg. moves, closes a modal)
      history.replaceState({} , '', `/${this.localeValue}/map`)
    });
  }

  setupClickEvents() {
    this.map.on('mouseenter', 'problems', () => {
      this.map.getCanvas().style.cursor = 'pointer';
    });
    this.map.on('mouseleave', 'problems', () => {
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

    // FIXME: make DRY
    this.map.on('mouseenter', 'areas', () => {
      if(this.map.getZoom() < 15) {
        this.map.getCanvas().style.cursor = 'pointer';
      }
    });
    this.map.on('mouseleave', 'areas', () => {
      if(this.map.getZoom() < 15) {
        this.map.getCanvas().style.cursor = '';
      }
    });

    this.map.on('click', 'areas', (e) => {
      if(this.map.getZoom() < 15) {
        let props = e.features[0].properties
        this.map.fitBounds([
            [props.southWestLon, props.southWestLat], // southwestern corner of the bounds
            [props.northEastLon, props.northEastLat] // northeastern corner of the bounds
          ], 
          {
            // document.getElementById('map').clientWidth
            padding: 5 // careful: may trigger an error on mobile devices "Map cannot fit within canvas with the given bounds, padding, and/or offset."
          }
        );
      }
    });

     // FIXME: make DRY
    this.map.on('mouseenter', 'areas-hulls', () => {
      if(this.map.getZoom() < 15) {
        this.map.getCanvas().style.cursor = 'pointer';
      }
    });
    this.map.on('mouseleave', 'areas-hulls', () => {
      if(this.map.getZoom() < 15) {
        this.map.getCanvas().style.cursor = '';
      }
    });

    this.map.on('click', 'areas-hulls', (e) => {
      if(this.map.getZoom() < 15) {
        let props = e.features[0].properties
        console.log(props)
        this.map.fitBounds([
            [props.southWestLon, props.southWestLat], // southwestern corner of the bounds
            [props.northEastLon, props.northEastLat] // northeastern corner of the bounds
          ], 
          {
            padding: 5 // careful: may trigger an error on mobile devices "Map cannot fit within canvas with the given bounds, padding, and/or offset."
          }
        );
      }
    });

    // FIXME: make DRY
    this.map.on('mouseenter', 'clusters', () => {
      if(this.map.getZoom() <= 12) {
        this.map.getCanvas().style.cursor = 'pointer';
      }
    });
    this.map.on('mouseleave', 'clusters', () => {
      if(this.map.getZoom() <= 12) {
        this.map.getCanvas().style.cursor = '';
      }
    });

    this.map.on('click', 'clusters', (e) => {
      if(this.map.getZoom() <= 12) {
        let props = e.features[0].properties
        this.map.fitBounds([
            [props.southWestLon, props.southWestLat], // southwestern corner of the bounds
            [props.northEastLon, props.northEastLat] // northeastern corner of the bounds
          ], 
          {
            padding: 5 // careful: may trigger an error on mobile devices "Map cannot fit within canvas with the given bounds, padding, and/or offset."
          }
        );
      }
    });
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

  gotoproblem(event) {
    this.map.flyTo({
      center: [event.detail.lon, event.detail.lat],
      zoom: 20,
      speed: 4,
      curve: 1,
      easing(t) {
        return t;
      }
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
    this.map.fitBounds([
        [event.detail.south_west_lon, event.detail.south_west_lat], // southwestern corner of the bounds
        [event.detail.north_east_lon, event.detail.north_east_lat] // northeastern corner of the bounds
      ], 
      {
        padding: 5 // careful: may trigger an error on mobile devices "Map cannot fit within canvas with the given bounds, padding, and/or offset."
      }
    );
  }
}