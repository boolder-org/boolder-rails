import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "map" ]

	connect() {
    console.log("connect")

    this.initMapkit() // FIXME: no need to call it everytime
    this.setupMap()
  }

  disconnect() {
    console.log("disconnect")

    this.map.destroy()
    this.map = undefined
  }

  initMapkit() {
    mapkit.init({
      authorizationCallback: function(done) {
          done("eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ilo2R05BUDc5N1QifQ.eyJpc3MiOiI4WTQ2QkNaVUw5IiwiaWF0IjoxNjExNTY4NTQ4LCJleHAiOjE5MzU2NTQ5NDh9.AwRdcYE4F3lTvEPUHtXAsGAHw2OXf4zBaGhK9_wGjM9hSsCzzrUPByzUYHSeuLrg8TJpt6-8q7DhpWaFLDe1Vg");
      },
      language: "fr"
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
