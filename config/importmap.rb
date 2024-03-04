# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# pin "stimulus-chartjs", to: "https://ga.jspm.io/npm:stimulus-chartjs@5.0.0/dist/stimulus-chartjs.mjs"
# pin "@kurkle/color", to: "https://ga.jspm.io/npm:@kurkle/color@0.3.2/dist/color.esm.js"
# pin "chart.js/auto", to: "https://ga.jspm.io/npm:chart.js@4.3.0/auto/auto.js"

pin "algoliasearch/lite", to: "https://ga.jspm.io/npm:algoliasearch@4.17.2/dist/algoliasearch-lite.umd.js"
pin "@algolia/autocomplete-js", to: "https://ga.jspm.io/npm:@algolia/autocomplete-js@1.9.3/dist/esm/index.js"
pin "@algolia/autocomplete-core", to: "https://ga.jspm.io/npm:@algolia/autocomplete-core@1.9.3/dist/esm/index.js"
pin "@algolia/autocomplete-plugin-algolia-insights", to: "https://ga.jspm.io/npm:@algolia/autocomplete-plugin-algolia-insights@1.9.3/dist/esm/index.js"
pin "@algolia/autocomplete-preset-algolia", to: "https://ga.jspm.io/npm:@algolia/autocomplete-preset-algolia@1.9.3/dist/esm/index.js"
pin "@algolia/autocomplete-shared", to: "https://ga.jspm.io/npm:@algolia/autocomplete-shared@1.9.3/dist/esm/index.js"
pin "@algolia/autocomplete-shared/dist/esm/core", to: "https://ga.jspm.io/npm:@algolia/autocomplete-shared@1.9.3/dist/esm/core/index.js"
pin "@algolia/autocomplete-shared/dist/esm/js", to: "https://ga.jspm.io/npm:@algolia/autocomplete-shared@1.9.3/dist/esm/js/index.js"
pin "@algolia/autocomplete-shared/dist/esm/preset-algolia/algoliasearch", to: "https://ga.jspm.io/npm:@algolia/autocomplete-shared@1.9.3/dist/esm/preset-algolia/algoliasearch.js"
pin "@algolia/autocomplete-shared/dist/esm/preset-algolia/createRequester", to: "https://ga.jspm.io/npm:@algolia/autocomplete-shared@1.9.3/dist/esm/preset-algolia/createRequester.js"
pin "htm", to: "https://ga.jspm.io/npm:htm@3.1.1/dist/htm.module.js"
pin "preact", to: "https://ga.jspm.io/npm:preact@10.15.1/dist/preact.module.js"