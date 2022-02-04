import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "map" ]
  static values = { 
    key: String, 
    language: String,
    annotations: Array,
    pois: Array,
    center: Object,
    span: Number,
  }

  connect() {
    let language = this.hasLanguageValue ? this.languageValue : 'en'
    this.initMapkit(this.keyValue, language) // FIXME: no need to call it everytime

    let annotations = this.hasAnnotationsValue ? this.annotationsValue : []
    let pois = this.hasPoisValue ? this.poisValue : []
    let center = this.hasCenterValue ? this.centerValue : null
    let span = this.hasSpanValue ? this.spanValue : 0.1
    this.setupMap(annotations, pois, center, span)
    
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

  setupMap(annotationsHash, poisHash, center, span) {
    this.map = new mapkit.Map(this.mapTarget, {
        isRotationEnabled: false,
        showsScale: mapkit.FeatureVisibility.Visible,
        showsUserLocationControl: true,
    });

    var MarkerAnnotation = mapkit.MarkerAnnotation;

    // points of interests
    var pois = poisHash.map(function (poiHash) {
      var coord = new mapkit.Coordinate(poiHash.latitude, poiHash.longitude);
      delete poiHash['latitude']; delete poiHash['longitude']; 
      return new MarkerAnnotation(coord, poiHash)
    });

    // annotations
    var annotations = annotationsHash.map(function (annotationHash) {
      var coord = new mapkit.Coordinate(annotationHash.latitude, annotationHash.longitude);
      delete annotationHash['latitude']; delete annotationHash['longitude']; 
      var annotation = new MarkerAnnotation(coord, annotationHash)

      if(annotationHash["linkUrl"]) {
        annotation.callout = {
          calloutContentForAnnotation: function(annotation) {
            var element = document.createElement("div");
            element.className = "apple-map-callout-content";
            var link = element.appendChild(document.createElement("a"));
            link.href = annotationHash["linkUrl"];
            link.target = "_blank"
            link.textContent = annotationHash["linkText"]
            
            return element;
          }
        };
      }

      return annotation
    });

    this.map.showItems(
      pois.concat(annotations),
      { padding: new mapkit.Padding(100, 100, 100, 100) } // FIXME: pass value from html
      );

    // set up visible viewport
    if (center) {
      this.map.region = new mapkit.CoordinateRegion(
        new mapkit.Coordinate(center.latitude, center.longitude),
        new mapkit.CoordinateSpan(span, span)
      )
    }
  }
}