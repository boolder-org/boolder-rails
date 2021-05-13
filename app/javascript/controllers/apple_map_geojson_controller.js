import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "map" ]
  static values = { 
    key: String, 
    language: String,
    geojson: String,
    redirect: String,
    center: Object,
    span: Number,
  }

  connect() {
    let language = this.hasLanguageValue ? this.languageValue : 'en'
    this.initMapkit(this.keyValue, language) // FIXME: no need to call it everytime

    let center = this.hasCenterValue ? this.centerValue : null
    let span = this.hasSpanValue ? this.spanValue : 0.1

    this.setupMap()
    this.loadGeoJSON(this.geojsonValue, this.redirectValue, center, span)
  }

  disconnect() {
    this.map.destroy()
    this.map = undefined
  }

  initMapkit(key, language) {
    mapkit.init({
      authorizationCallback: function(done) {
          done(key);
      },
      language: language
    });
  }

  setupMap() {
    this.map = new mapkit.Map(this.mapTarget, {
        isRotationEnabled: false,
        showsScale: mapkit.FeatureVisibility.Visible,
        showsUserLocationControl: true,
    });
  }

  loadGeoJSON(file, redirect, center, span) {
    var map = this.map

    mapkit.importGeoJSON(file, {
        
        itemForFeature: function(overlay, geoJSON) {
            overlay.data = {
                name: geoJSON.properties.name,
                id: geoJSON.id,
            };

            // boulder
            if(geoJSON.geometry.type == "Polygon") {
                overlay.style = new mapkit.Style({
                    lineWidth: 1,
                    fillColor: "rgb(80% 80% 80%)",
                    fillOpacity: 1.0,
                    strokeColor: "rgb(70% 70% 70%)",
                    // strokeOpacity: .2,
                    lineJoin: "round",
                    // lineDash: [2, 2, 6, 2, 6, 2]
                });
            }
            // problem
            else if(geoJSON.geometry.type == "Point" && geoJSON.id.startsWith("problem")) {

              overlay.data.grade = geoJSON.properties.grade

                var calloutDelegate = {

                    // same thing as calloutContentForAnnotation but without the container
                    // calloutElementForAnnotation: function(annotation) {
                    // },

                    calloutContentForAnnotation: function(annotation) {
                        var element = document.createElement("div");
                        element.className = "apple-map-callout-content";
                        var link = element.appendChild(document.createElement("a"));
                        link.href = redirect + annotation.data.id;
                        link.target = "_blank"
                        link.textContent = `${annotation.data.name || ""} ${annotation.data.grade}`
                        
                        return element;
                    }
                };

                let colorMapping = {
                  "yellow":   "#FFCC02",
                  "purple":   "#D783FF",
                  "orange":   "#FF9500",
                  "green":    "#77C344",
                  "blue":     "#017AFF",
                  "skyblue":  "#5AC7FA",
                  "salmon":   "#FDAF8A",
                  "red":      "#FF3B2F",
                  "black":    "#000000",
                  "white":    "#FFFFFF",
                }

                overlay.animates = false
                overlay.displayPriority = (geoJSON.properties.circuitNumber && geoJSON.properties.circuitNumber.length > 0)  ? mapkit.Annotation.DisplayPriority.High : mapkit.Annotation.DisplayPriority.Low
                overlay.color = colorMapping[geoJSON.properties.circuitColor] || "rgb(66% 66% 66%)"
                overlay.glyphText = geoJSON.properties.circuitNumber || " "
                overlay.glyphColor = (geoJSON.properties.circuitColor == "white") ? "#333" : "#FFF"
                overlay.callout = calloutDelegate
            }
            // circuit
            else if(geoJSON.geometry.type == "LineString" && geoJSON.id.startsWith("circuit")) {
              return null;
            }
            // poi
            else if(geoJSON.geometry.type == "Point" && geoJSON.id.startsWith("poi")) {
              overlay.color = "rgb(128 128 128)"
              overlay.glyphText = "P"
              overlay.title = "Parking"
            }
            // poi route
            else if(geoJSON.geometry.type == "LineString" && geoJSON.id.startsWith("poiroute")) {
              overlay.style = new mapkit.Style({
                  lineWidth: 2,
                  strokeColor: "rgb(128 128 128)",
                  // strokeOpacity: .2,
                  lineJoin: "round",
                  lineDash: [5, 5]
              });

              overlay.color = "rgb(128 128 128)"
              overlay.lineWidth = 2
              overlay.lineJoin = "round"
              overlay.lineDash = [5, 5]
            }
            else {
                
            }

            return overlay;
        },
    
        geoJSONDidComplete: function(overlays) {
            map.addItems(overlays);
            map.showItems(overlays.getFlattenedItemList());

            // set up visible viewport
            if (center) {
              map.region = new mapkit.CoordinateRegion(
                new mapkit.Coordinate(center.latitude, center.longitude),
                new mapkit.CoordinateSpan(span, span)
              )
            }
        }
    });

  }
}
