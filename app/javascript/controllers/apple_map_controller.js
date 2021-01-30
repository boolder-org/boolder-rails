import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "map" ]
  static values = { 
    key: String, 
    language: String,
    annotation: Object,
    pois: Array,
    span: Number,
  }

	connect() {
    let language = this.hasLanguageValue ? this.languageValue : 'en'
    this.initMapkit(this.keyValue, language) // FIXME: no need to call it everytime

    let annotation = this.hasAnnotationValue ? this.annotationValue : {}
    let pois = this.hasPoisValue ? this.poisValue : []
    let span = this.hasSpanValue ? this.spanValue : 0.1
    this.setupMap(this.annotationValue, pois, span)
    
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

  setupMap(annotationHash, poisHash, span) {
    this.map = new mapkit.Map(this.mapTarget, {
        isRotationEnabled: false
    });

    var MarkerAnnotation = mapkit.MarkerAnnotation;

    // points of interests
    var pois = poisHash.map(function (poiHash) {
      var coord = new mapkit.Coordinate(poiHash.latitude, poiHash.longitude);
      delete poiHash['latitude']; delete poiHash['longitude']; 
      return new MarkerAnnotation(coord, poiHash)
    });
    this.map.addAnnotations(pois);

    // main annotation
    var center = new mapkit.Coordinate(annotationHash.latitude, annotationHash.longitude);
    delete annotationHash['latitude']; delete annotationHash['longitude']; 
    this.map.addAnnotation(new MarkerAnnotation(center, annotationHash));

    // set up visible viewport
    this.map.region = new mapkit.CoordinateRegion(
      center,
      new mapkit.CoordinateSpan(span, span)
    )
  }
}
