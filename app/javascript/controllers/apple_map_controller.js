import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "map" ]
  static values = { key: String, language: String }

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
        isRotationEnabled: false
    });

    var MarkerAnnotation = mapkit.MarkerAnnotation,
            clickAnnotation;
    var avonTrainStation = new mapkit.Coordinate(48.416398, 2.726505),
        boisLeRoiTrainStation = new mapkit.Coordinate(48.475550, 2.691822),
        parking = new mapkit.Coordinate(48.462965, 2.665628);

        // Setting properties on creation:
    var avonTrainStationAnnotation = new MarkerAnnotation(avonTrainStation, { color: "#ccc", title: "Fontainebleau", subtitle: "Gare Avon", glyphText: "🚆" });

    var boisLeRoiTrainStationAnnotation = new MarkerAnnotation(boisLeRoiTrainStation, { color: "#ccc", title: "Bois le Roi", subtitle: "Gare", glyphText: "🚆" });
    
    // Setting properties after creation:
    var parkingAnnotation = new MarkerAnnotation(parking);
    parkingAnnotation.color = "#059669"; 
    parkingAnnotation.title = "Rocher Canon";
    parkingAnnotation.subtitle = "Parking";
    // parkingAnnotation.selected = "true";
    parkingAnnotation.glyphText = "";
    
    // Add and show both annotations on the map
    this.map.showItems([avonTrainStationAnnotation, boisLeRoiTrainStationAnnotation, parkingAnnotation]);


    this.map.region = new mapkit.CoordinateRegion(
      parking,
      new mapkit.CoordinateSpan(0.10, 0.11)
    )
  }
}
