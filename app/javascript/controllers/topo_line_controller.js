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

    let pathString = "M 42 204.99 C 42 204.99 35.944 170.73064133016626 49 156 62.056 141.26935866983374 73.932 150.36901023890786 92.52 147.99 111.10799999999999 145.61098976109216 137.67999999999998 145.06358087487283 154.48 142.5 171.28 139.93641912512717 199.968 139.34272407732865 210.48 129.99 220.992 120.63727592267136 245.52 61.49999999999999 245.52 61.49999999999999"

    this.path.setAttribute("d", pathString);
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

}
