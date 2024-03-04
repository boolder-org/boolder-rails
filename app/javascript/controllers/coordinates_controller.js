import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["latitude", "longitude", "link"]

  paste(event) {
    const input = event.clipboardData.getData('text')
    const coords = input.split(/,|\//)

    if (coords.length === 2) {
      const [lat, lng] = coords.map(coord => parseFloat(coord.trim()))
      if (!isNaN(lat) && !isNaN(lng)) {
        this.latitudeTarget.value = lat
        this.longitudeTarget.value = lng
        event.preventDefault() // Prevent the default paste behavior
      }
    }
  }

  copy() {
    navigator.clipboard.writeText([this.latitudeTarget.value, this.longitudeTarget.value].join(","))
    this.linkTarget.innerHTML = "copied!"
  }
}
