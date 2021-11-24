import { Controller } from "stimulus"

import algoliasearch from 'algoliasearch/lite';
import { autocomplete, getAlgoliaResults } from '@algolia/autocomplete-js';
// import { createLocalStorageRecentSearchesPlugin } from '@algolia/autocomplete-plugin-recent-searches';

// import { h, Fragment } from 'preact';

export default class extends Controller {
  static targets = [ ]
  static values = { 
    locale: String,
  }

  open() {
    // console.log("open!")
    // this.autokomplete.setQuery("test");
    this.autokomplete.setIsOpen(true)
  }

  connect() {
    let locale = this.hasLocaleValue ? this.localeValue : 'en'

    // const recentSearchesPlugin = createLocalStorageRecentSearchesPlugin({
    //   key: 'RECENT_SEARCH',
    //   limit: 5,
    // });

    const searchClient = algoliasearch(
      'XNJHVMTGMF',
      '765db6917d5c17449984f7c0067ae04c'
    );
    
    this.autokomplete = autocomplete({
      container: '#autocomplete',
      plugins: [
          // recentSearchesPlugin,
        ],
      debug: true, // FIXME: remove
      // hint: false,
      openOnFocus: true,
      placeholder: 'Voie ou secteur',
      translations: {
        clearButtonTitle: 'Effacer', // defaults to 'Clear'
        detachedCancelButtonText: 'Annuler', // defaults to 'Cancel'
        submitButtonTitle: 'Chercher', // defaults to 'Submit'

      },
      detachedMediaQuery: "(max-width: 55680px)", // FIXME
      // openOnFocus: true,
      getSources({ query }) {
        if(query.length == 0) { return [] };
        
        return [

          {
            sourceId: 'areas',
            getItems() {
              return getAlgoliaResults({
                searchClient,
                queries: [
                  {
                    indexName: 'Area',
                    query,
                    params: {
                      hitsPerPage: 3,
                      highlightPreTag: '<strong>',
                      highlightPostTag: '</strong>',
                    },
                  },
                ],
              });
            },

            templates: {
              item({ item, createElement }) {
                return createElement('div', {
                  dangerouslySetInnerHTML: {
                    __html: `<span class="">
                    ${item._highlightResult.name.value}
                    </span>`,
                  },
                });
              },
              // footer({ items, createElement }) {
              //   if (items.length === 0) {
              //     return null;
              //   }
              //   return createElement('div', {
              //     dangerouslySetInnerHTML: {
              //       __html: `<div class="">
              //         <div class="flex items-center my-1" aria-hidden="true">
              //           <div class="w-full border-t border-green-600"></div>
              //         </div>
              //       </div>`,
              //     },
              //   });
              // },
            },

            // getItemInputValue({ item }) {
            //     return item.name;
            //   },

            getItemUrl({ item }) {
              return `/${locale}/redirects/new?area_id=${item.objectID}`
            },

            onSelect({ item }) {
              document.location.href=`/${locale}/redirects/new?area_id=${item.objectID}`
            },

            

          },


          {
            sourceId: 'problems',
            getItems() {
              return getAlgoliaResults({
                searchClient,
                queries: [
                  {
                    indexName: 'Problem',
                    query,
                    params: {
                      hitsPerPage: 10,
                      highlightPreTag: '<strong>',
                      highlightPostTag: '</strong>',
                    },
                  },
                ],
              });
            },

            templates: {
              item({ item, createElement }) {

                const colorMapping = {
                      "yellow":   "#FFCC02",
                      "purple":   "#D783FF",
                      "orange":   "#FF9500",
                      "green":    "#77C344",
                      "blue":     "#017AFF",
                      "skyblue":  "#5AC7FA",
                      "salmon":   "#FDAF8A",
                      "red":      "#FF3B2F",
                      "black":    "#000000",
                      "white":    "#FFFFFF",
                    }

                function bgColor(circuit_color) {
                  return colorMapping[circuit_color] || "rgb(80% 80% 80%)"
                }

                function textColor(circuit_color) {
                  return (circuit_color == "white") ? "#333" : "#FFF"
                }

                return createElement('div', {
                  dangerouslySetInnerHTML: {
                    __html: `<div class="flex justify-between items-center">
                      <div class="flex items-center">
                        <span style="background: ${bgColor(item.circuit_color)}; color: ${textColor(item.circuit_color)}" class="rounded-full h-6 w-6 leading-6 inline-flex justify-center flex-shrink-0">
                        ${item.circuit_number || "&nbsp;"}
                        </span>
                        <span class="ml-2">
                        ${item._highlightResult.name.value}
                        </span>
                      </div>
                      <span class="ml-2 text-gray-400 flex-shrink-0">
                        ${item.area_name}
                      </span>
                    </div>`,
                  },
                });
              },
              // header({ items, createElement }) {
              //   if (items.length === 0) {
              //     return null;
              //   }
              //   return createElement('div', {
              //     dangerouslySetInnerHTML: {
              //       __html: `<span class="text-green-600">
              //       Voies
              //       </span>`,
              //     },
              //   });
              // },
              // noResults() {
              //   return 'No results';
              // },
            },

            // getItemInputValue({ item }) {
            //     return item.name;
            //   },

            getItemUrl({ item }) {
              return `/${locale}/redirects/new?problem_id=${item.objectID}`
            },

            onSelect({ item }) {
              document.location.href=`/${locale}/redirects/new?problem_id=${item.objectID}`
            },

            

          },

          


        ];
      },
    });

    

  }
}