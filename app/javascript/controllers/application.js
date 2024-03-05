import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// Hack to make algolia autocomplete work
// (the npm package assumes window.process["NODE_ENV"] is present)
window.process = {
  env: { NODE_ENV: 'production' } // or 'development', depending on your needs
};