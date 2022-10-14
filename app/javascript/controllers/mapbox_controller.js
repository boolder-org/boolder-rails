import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "map" ]

  connect() {
    mapboxgl.accessToken = 'pk.eyJ1Ijoibm1vbmRvbGxvdCIsImEiOiJja2hwMXMzZWgwcndhMnJrOHY1a3c0eHE5In0.F4P_5ZCsauDFiSqrxqjZ8w';

    this.map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/nmondollot/cl95n147u003k15qry7pvfmq2/draft', //  mapbox://styles/mapbox/outdoors-v11 
    center: [2.700883, 48.407834],
    zoom: 10
    });

    // Add zoom and rotation controls to the map.
    this.map.addControl(new mapboxgl.NavigationControl());

    let that = this

    this.map.on('load', () => {
      const layers = that.map.getStyle().layers;
      // Find the index of the first symbol layer in the map style.
      let firstSymbolId;
      for (const layer of layers) {
      if (layer.type === 'symbol') {
      firstSymbolId = layer.id;
      break;
      }
      }

      that.map.addSource('problems', {
        type: 'vector',
        url: 'mapbox://nmondollot.4xsv235p' 
      });

      that.map.addLayer({
        'id': 'boulders',
        'type': 'fill',
        'source': 'problems',
        'source-layer': 'problems-ayes3a',
        'layout': {
          // Make the layer visible by default.
          'visibility': 'visible'
        },
        'paint': {
          'fill-color': '#b5b5b5',
          'fill-outline-color': "hsl(0, 0%, 44%)",
        },
        filter: [
          "match",
            ["geometry-type"],
            ["Polygon"],
            true,
            false
        ],
      }
      ,
      firstSymbolId
      );

      that.map.addLayer({
        'id': 'problems',
        'type': 'circle',
        'source': 'problems',
        'source-layer': 'problems-ayes3a',
        'layout': {
          // Make the layer visible by default.
          'visibility': 'visible'
        },
        'paint': {
          'circle-radius': 
            [
              "interpolate",
              ["linear"],
              ["zoom"],
              18,
              2,
              22,
              [
                "case",
                ["has", "circuitId"],
                20,
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
              "#a9a9a9"
            ]
          ,
          'circle-opacity': 
          [
            "interpolate",
            ["linear"],
            ["zoom"],
            15,
            0,
            17,
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
      });

      that.map.addLayer({
        'id': 'problem-symbols',
        'type': 'symbol',
        'source': 'problems',
        'source-layer': 'problems-ayes3a',
        'minzoom': 17,
        'layout': {
          // Make the layer visible by default.
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
            18,
            2,
            22,
            28
          ],
          'text-font': [
            'Open Sans Bold',
            'Arial Unicode MS Regular'
          ],
        },
        'paint': {
          // 'text-opacity': [
          //   "step",
          //   ["zoom"],
          //   0,
          //   18,
          //   0,
          //   19,
          //   1
          // ],
          'text-color': 
          // '#f5f5f5'
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

    });

    // When a click event occurs on a feature in the places layer, open a popup at the
    // location of the feature, with description HTML from its properties.
    this.map.on('click', 'problems', (e) => {

      // console.log(e.features[0])
      // console.log(e.features[0].geometry)
      // var name = e.features[0].properties.name

      // Copy coordinates array.
      const coordinates = e.features[0].geometry.coordinates.slice();
      const html = `<a href="#" onclick="window.location.href = '/fr/redirects/new?problem_id=${e.features[0].properties.id})'">${e.features[0].properties.name}</a>`;
       
      new mapboxgl.Popup({closeButton:false, focusAfterOpen: false}) // , offset: xxx
      .setLngLat(coordinates)
      .setHTML(html)
      .addTo(this.map);

      // window.location.href = "/fr/redirects/new?problem_id=" + e.features[0].properties.id;
    });

    // Change the cursor to a pointer when the mouse is over the places layer.
    this.map.on('mouseenter', 'problems', () => {
    this.map.getCanvas().style.cursor = 'pointer';
    });
     
    // Change it back to a pointer when it leaves.
    this.map.on('mouseleave', 'problems', () => {
    this.map.getCanvas().style.cursor = '';
    });

  }

  gotoproblem(event) {
    // console.log("spatch")
    // console.log(event.detail)

    this.map.flyTo({
      center: [event.detail.lon, event.detail.lat],
      zoom: 20,
      speed: 4,
      curve: 1,
      easing(t) {
      return t;
      }
    });

    // // Copy coordinates array.
      const coordinates = [event.detail.lon, event.detail.lat];
      const html = `<a href="/fr/redirects/new?problem_id=${event.detail.id}">${event.detail.name}</a>`;
       
      new mapboxgl.Popup({closeButton:false, focusAfterOpen: false}) // , offset: xxx
      .setLngLat(coordinates)
      .setHTML(html)
      .addTo(this.map);
  }
}