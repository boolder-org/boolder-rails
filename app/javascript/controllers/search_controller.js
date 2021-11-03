import { Controller } from "stimulus"

import algoliasearch from "algoliasearch";
import autocomplete from "autocomplete.js";

export default class extends Controller {
  static targets = [ "searchBar" ]

  connect() {
    var client = algoliasearch(this.searchBarTarget.dataset.algoliaId, this.searchBarTarget.dataset.algoliaSearchKey);
    var index = client.initIndex('Problem');

    function newHitsSource(index, params) {
      return function doSearch(query, cb) {
        index
        .search(query, params)
        .then(function(res) {
          cb(res.hits, res);
        })
        .catch(function(err) {
          console.error(err);
          cb([]);
        });
      };
    }
    // Set hint: true to false, if you don't want a predictive hint to show up for users as they type
    autocomplete('#search-input', { hint: true }, [
      {
        // Change hitsPerPage as needed
        source: newHitsSource(index, { hitsPerPage: 10 }),
        displayKey: 'name',
        templates: {
          suggestion: function(suggestion) {
            // Change the return here to whatever you wish to be displayed in the dropdown
            return `${suggestion._highlightResult.name.value}`;
          }
        }
      }
    ]).on('autocomplete:selected', function(event, suggestion, dataset, context) {
      console.log(event, suggestion, dataset, context);
    });
  }
}