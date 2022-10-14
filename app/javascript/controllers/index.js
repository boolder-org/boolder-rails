// Load all the controllers within this directory and all subdirectories. 
// Controller files must be named *_controller.js.

import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

// enable Stimulus debug mode in development
// application.debug = process.env.NODE_ENV === 'development'

import Chart from "stimulus-chartjs"
application.register("chart", Chart)

import { Dropdown, Tabs } from "tailwindcss-stimulus-components"
application.register('dropdown', Dropdown)
application.register('tabs', Tabs)