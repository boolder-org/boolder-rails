import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "svg", "image" ]
  static values = { 
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
    this.path.setAttribute("stroke", "blue");
    this.path.setAttribute("stroke-width", "3");
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
    let lines = [{"x":0.105*400,"y":0.6833*300},{"x":0.1225*400,"y":0.52*300},{"x":0.2313*400,"y":0.4933*300},{"x":0.3862*400,"y":0.475*300},{"x":0.5262*400,"y":0.4333*300},{"x":0.6138*400,"y":0.205*300}]

    return this.bzCurve(lines, 0.3, 1);

    // return "M 42 204.99 C 42 204.99 35.944 170.73064133016626 49 156 62.056 141.26935866983374 73.932 150.36901023890786 92.52 147.99 111.10799999999999 145.61098976109216 137.67999999999998 145.06358087487283 154.48 142.5 171.28 139.93641912512717 199.968 139.34272407732865 210.48 129.99 220.992 120.63727592267136 245.52 61.49999999999999 245.52 61.49999999999999"
  }


  // inspired by https://stackoverflow.com/a/39559854/230309
  bzCurve(points = [], f, t) {
    if(points.length == 0) { return "" }

    //f = 0, will be straight line
    //t suppose to be 1, but changing the value can control the smoothness too
    if (typeof(f) == 'undefined') f = 0.3;
    if (typeof(t) == 'undefined') t = 0.6;

    var string = "M " + points[0].x + " " + points[0].y + " C "
    console.log(string)

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
