import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "map" ]
  static values = { 
    key: String, 
    language: String,
    annotations: Array,
    pois: Array,
    span: Number,
  }

  connect() {
    let language = this.hasLanguageValue ? this.languageValue : 'en'
    this.initMapkit(this.keyValue, language) // FIXME: no need to call it everytime

    let annotations = this.hasAnnotationsValue ? this.annotationsValue : []
    let pois = this.hasPoisValue ? this.poisValue : []
    let span = this.hasSpanValue ? this.spanValue : 0.1
    this.setupMap(annotations, pois, span)
    
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

  setupMap(annotationsHash, poisHash, span) {
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
      return new MarkerAnnotation(coord, annotationHash)
    });

    this.map.showItems(pois.concat(annotations));
  }
}