import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "textarea", "canvas", "container", "image" ]

	connect() {
		this.points = []
		this.resize()
	}

	resize() {
		var image = this.imageTarget
		var container = this.containerTarget
		var canvas = this.canvasTarget

		this.detectImageSize(function(width, height){
  		image.width = width
  		image.height = height
  		container.width = width
  		container.height = height
  		canvas.width = width
  		canvas.height = height
		})
	}

	detectImageSize(callback) {
	  var image = this.imageTarget
	  image.onload = function() {
	    callback(image.naturalWidth, image.naturalHeight)
	  }
	}

  createPoint(event) {
  	var canvas = this.canvasTarget
  	var textarea = this.textareaTarget
  	var container = this.containerTarget

  	var x = event.pageX - container.offsetLeft
    var y = event.pageY - container.offsetTop
    var point = {'x': this.limitPrecision(x/canvas.width), 'y': this.limitPrecision(y/canvas.height) }

    this.points.push(point)
    textarea.value = JSON.stringify(this.points)

    this.draw(x,y)
  }

  draw(x,y) {
  	var canvas = this.canvasTarget

  	var canvasWidth = canvas.width
		var canvasHeight = canvas.height
		var ctx = canvas.getContext("2d")

		ctx.fillStyle = "#ff2626"; // Red color
		var pointSize = 8

    ctx.beginPath(); //Start path
    ctx.arc(x, y, pointSize, 0, Math.PI * 2, true); // Draw a point using the arc function of the canvas with a point structure.
    ctx.fill(); // Close the path and fill.
  }

  limitPrecision(value) {
  	return parseFloat(value.toFixed(4))
  }
}
