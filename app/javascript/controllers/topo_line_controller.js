import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "svg", "image" ]
  static values = { 
    coordinates: Array,
    color: String,
    strokeWidth: String,
  }

	connect() {
    var image = this.imageTarget
    var self = this

    image.onload = function() {
      setTimeout(function(){
        self.createPath()
        self.animatePath()
      }, 500);
    }
  }

  disconnect() {
    this.path = undefined
  }

  createPath() {
    this.path = document.createElementNS("http://www.w3.org/2000/svg", "path");

    this.path.setAttribute("d", this.pathString());
    this.path.setAttribute("stroke", this.hasColorValue ? this.colorValue : "black" );
    this.path.setAttribute("stroke-width", this.hasStrokeWidthValue ? this.strokeWidthValue : "3");
    this.path.setAttribute("fill", "none");
    
    this.svgTarget.appendChild(this.path);
  }


  // inspired by https://jakearchibald.com/2013/animated-line-drawing-svg/
  animatePath() {
    let length = this.path.getTotalLength();

    // Clear any previous transition
    this.path.style.transition = this.path.style.WebkitTransition = 'none';
    // Set up the starting positions
    this.path.style.strokeDasharray = length + ' ' + length;
    this.path.style.strokeDashoffset = length;
    // Trigger a layout so styles are calculated & the browser
    // picks up the starting position before animating
    this.path.getBoundingClientRect();
    // Define our transition
    this.path.style.transition = this.path.style.WebkitTransition =
      'stroke-dashoffset 0.5s ease-in-out';

    this.path.style.strokeDashoffset = '0';
  }

  // please call me when the "turbo:before-cache" event is fired
  // by placing a data-action="turbo:before-cache@window->topo-line#hidePath" in the html
  // so that there isn't a flickering when the page animates for a 2nd time
  hidePath() {
    this.svgTarget.classList.add("hidden")
  }

  pathString() {
    let scaledCoordinates = this.coordinatesValue.map(point => ({ "x": point.x*400, "y": point.y*300 }));
    return this.bezierCurve(scaledCoordinates, 0.3, 1);
  }


  // inspired by https://stackoverflow.com/a/39559854/230309
  bezierCurve(points = [], f, t) {
    if(points.length == 0) { return "" }

    //f = 0, will be straight line
    //t suppose to be 1, but changing the value can control the smoothness too
    if (typeof(f) == 'undefined') f = 0.3;
    if (typeof(t) == 'undefined') t = 0.6;

    var string = "M " + points[0].x + " " + points[0].y + " C "

    var m = 0;
    var dx1 = 0;
    var dy1 = 0;
    var dx2 = 0;
    var dy2 = 0;

    var preP = points[0];
    for (var i = 1; i < points.length; i++) {
      var curP = points[i];
      var nexP = points[i + 1];
      if (nexP) {
        m = this.gradient(preP, nexP);
        dx2 = (nexP.x - curP.x) * -f;
        dy2 = dx2 * m * t;
      } else {
        dx2 = 0;
        dy2 = 0;
      }

      string += " " + Math.round(preP.x - dx1) + " " + Math.round(preP.y - dy1) 
        + " " + Math.round(curP.x + dx2) + " " + Math.round(curP.y + dy2) 
        + " " + Math.round(curP.x) + " " + Math.round(curP.y)
              
      dx1 = dx2;
      dy1 = dy2;
      preP = curP;
    }

    return string
  }

  gradient(a, b) {
    return (b.y-a.y)/(b.x-a.x);
  }
}
