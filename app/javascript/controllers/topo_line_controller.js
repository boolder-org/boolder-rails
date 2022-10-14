import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "svg", "image", "circle" ]
  static values = { 
    coordinates: Array,
    color: String,
    strokeWidth: String,
  }

  connect() {
    var image = this.imageTarget
    var circleTargets = this.circleTargets
    var self = this

    image.onload = function() {
      circleTargets.forEach(circle => {
        circle.classList.remove("hidden")
      })

      setTimeout(function(){
        self.createPath()
        self.animatePath()
      }, 500);
    }

    image.src = image.src // hack to trigger image.onload even when the image is cached by the browser
  }

  disconnect() {
    this.path = undefined
  }

  createPath() {
    this.path = document.createElementNS("http://www.w3.org/2000/svg", "path");

    this.path.setAttribute("d", this.pathString());
    this.path.setAttribute("stroke", this.hasColorValue ? this.colorValue : "black" );
    this.path.setAttribute("stroke-linecap", "round");
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
    this.svgTarget.innerHTML = ''
  }

  pathString() {
    let scaledCoordinates = this.coordinatesValue.map(point => ({ "x": point.x*400, "y": point.y*300 }));
    return this.bezierCurve(scaledCoordinates);
  }


  // inspired by https://stackoverflow.com/a/7058606/230309
  bezierCurve(points = []) {
    if(points.length < 1) { return "" }

    var string = "M " + points[0].x + " " + points[0].y + " Q "

    for (var i = 1; i < points.length - 2; i ++)
    {
      var xc = (points[i].x + points[i + 1].x) / 2;
      var yc = (points[i].y + points[i + 1].y) / 2;

      string += " " + Math.round(points[i].x) + " " + Math.round(points[i].y) + " " + Math.round(xc) + " " + Math.round(yc)
    }

    string += " " + Math.round(points[i].x) + " " + Math.round(points[i].y) + " " + Math.round(points[i+1].x) + " " + Math.round(points[i+1].y)

    return string
  }
}
