// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/activestorage").start()
require("channels")
require("@hotwired/turbo-rails")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// note to self: not sure what I'm doing
// I just copy-pasted stuff from 
// https://davidteren.medium.com/tailwindcss-2-0-with-rails-6-1-postcss-8-0-9645e235892d
require("stylesheets/application.scss")

// Stimulus controllers
import "controllers"

// document.addEventListener("turbo:load", function() {
//   console.log("Turbo loaded!")
// })