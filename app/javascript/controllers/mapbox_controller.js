// This file is getting too complex and will eventually need some refactoring
// Note: we could buy some time by removing/refactoring the "sector 7a" code introduced here: https://github.com/nmondollot/boolder/pull/26
// (lots of complexity for such a small feature)

import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 
    "map", 
    "gradeRadioButton", "gradeMin", "gradeMax", "customGradePicker",
    "filterCounter", "filterIcon" 
  ]
  static values = { 
    token: String,
    bounds: Object,
    problem: Object,
    locale: { type: String, default: 'en' },
    draft: { type: Boolean, default: false },
    contribute: { type: Boolean, default: false },
    contributeSource: String,
  }

  connect() {
    mapboxgl.accessToken = this.tokenValue;

    this.map = new mapboxgl.Map({
      container: 'map',
      style: "mapbox://styles/scottrw93/cm4d52nth01ke01siapcz7ixi",
      //https://api.mapbox.com/styles/v1/scottrw93/cm4d2sp1001oj01sd6s870407?access_token=pk.eyJ1Ijoic2NvdHRydzkzIiwiYSI6ImNtM3VvNnhxdjBubmoya3NjeTcwa2hsZ3kifQ.1rZcr4aDBrhKD-PgMYgv_Q

      center: [-6.38003, 53.006426],
      zoom: 9 
    });
  }
}