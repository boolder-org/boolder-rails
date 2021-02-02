import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "map" ]
  static values = { 
    key: String, 
    language: String,

  }

	connect() {
    let language = this.hasLanguageValue ? this.languageValue : 'en'
    this.initMapkit(this.keyValue, language) // FIXME: no need to call it everytime

    this.setupMap()
    
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

    var map = this.map

    mapkit.importGeoJSON("/area-1-data.geojson", {
        
        itemForFeature: function(overlay, geoJSON) {
            overlay.data = {
                name: geoJSON.properties.name,
                id: geoJSON.id,
            };

            // boulder
            if(geoJSON.geometry.type == "Polygon") {
                overlay.style = new mapkit.Style({
                    fillOpacity: 0.7,
                    lineWidth: 0.3,
                    fillColor: "#ccc",
                    strokeColor: "aaa",
                    // strokeOpacity: .2,
                    // lineJoin: "round",
                    // lineDash: [2, 2, 6, 2, 6, 2]
                });
            }
            // problem
            else if(geoJSON.geometry.type == "Point") {

              overlay.data.grade = geoJSON.properties.grade

                var calloutDelegate = {

                    // same thing as calloutContentForAnnotation but without the container
                    // calloutElementForAnnotation: function(annotation) {
                    // },

                    calloutContentForAnnotation: function(annotation) {
                        var element = document.createElement("div");
                        element.className = "problem-callout-content";
                        var link = element.appendChild(document.createElement("a"));
                        link.href = `/geojson/${annotation.data.id}`;
                        link.textContent = `${annotation.data.name || ""} ${annotation.data.grade}`
                        
                        return element;
                    }
                };


                overlay.animates = false
                overlay.displayPriority = (geoJSON.properties.circuitNumber && geoJSON.properties.circuitNumber.length > 0)  ? mapkit.Annotation.DisplayPriority.High : mapkit.Annotation.DisplayPriority.Low
                overlay.color = geoJSON.properties.circuitColor || "#ccc"
                overlay.glyphText = geoJSON.properties.circuitNumber || " "
                overlay.callout = calloutDelegate
            }
            else {
                
            }

            return overlay;
        },
    
        geoJSONDidComplete: function(overlays) {
            map.addItems(overlays);
            map.showItems(overlays.getFlattenedItemList());
        }
    });

  }
}
