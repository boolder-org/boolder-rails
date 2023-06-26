import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "textarea", "canvas", "container", "image", "form" ]

  connect() {
    this.points = []

    var image = this.imageTarget
    var self = this

    image.onload = function() {
      self.resize(image.naturalWidth/2, image.naturalHeight/2)
      self.drawOriginalPoints()
    }

    image.src = image.src // hack to trigger image.onload even when the image is cached by the browser
  }

  resize(width, height) {
    var image = this.imageTarget
    var container = this.containerTarget
    var canvas = this.canvasTarget

    image.width = width
    image.height = height
    container.width = width
    container.height = height
    canvas.width = width
    canvas.height = height
  }

  createPoint(event) {
    var canvas = this.canvasTarget
    var textarea = this.textareaTarget
    var container = this.containerTarget

    var x = event.pageX - container.offsetLeft
    var y = event.pageY - container.offsetTop

    var percentX = this.limitPrecision(x/canvas.width)
    var percentY = this.limitPrecision(y/canvas.height)

    var point = {'x': percentX, 'y': percentY }

    this.points.push(point)
    textarea.value = JSON.stringify(this.points)

    this.draw(point, "#ff2626")
  }

  limitPrecision(value) {
    return parseFloat(value.toFixed(4))
  }

  draw(point, color) {
    // console.log(point.x + ";" + point.y)
    var canvas = this.canvasTarget

    var canvasWidth = canvas.width
    var canvasHeight = canvas.height
    var ctx = canvas.getContext("2d")

    ctx.fillStyle = color
    var pointSize = 8

    ctx.beginPath() //Start path
    ctx.arc(point.x * canvasWidth, point.y * canvasHeight, pointSize, 0, Math.PI * 2, true) // Draw a point using the arc function of the canvas with a point structure.
    ctx.fill() // Close the path and fill.
  }

  drawOriginalPoints() {
    var originalPoints = JSON.parse(this.textareaTarget.value)
    var self = this

    originalPoints.forEach(function (point, index) {
      self.draw(point, "#0000ff")
    })
  }
}
