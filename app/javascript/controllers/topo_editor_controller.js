import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "image", "textarea" ]

	initialize() {
		this.points = []
	}

  createPoint(event) {
  	var image = this.imageTarget
  	var textarea = this.textareaTarget

  	var x = event.pageX - image.offsetLeft
    var y = event.pageY - image.offsetTop
    var point = {'x': this.limitPrecision(x/image.width), 'y': this.limitPrecision(y/image.height) }

    this.points.push(point)
    textarea.value = JSON.stringify(this.points)
  }

  limitPrecision(value) {
  	return parseFloat(value.toFixed(4))
  }
}
