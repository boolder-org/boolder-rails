// Load all the controllers within this directory and all subdirectories. 
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

import Chart from "stimulus-chartjs"
application.register("chart", Chart)

import { Dropdown, Tabs } from "tailwindcss-stimulus-components"
application.register('dropdown', Dropdown)
application.register('tabs', Tabs)