import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['item']

  connect () {
  }

  toggle () {
    this.itemTargets.forEach(item => {
      item.classList.add("transition")
      item.classList.toggle("transform")
      item.classList.toggle("rotate-90")
    })
  }
}