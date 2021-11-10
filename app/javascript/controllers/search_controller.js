import { Controller } from "stimulus"

import algoliasearch from 'algoliasearch/lite';
import { autocomplete, getAlgoliaResults } from '@algolia/autocomplete-js';
// import { h, Fragment } from 'preact';

export default class extends Controller {
  static targets = [ ]

  connect() {

    const searchClient = algoliasearch(
      'XNJHVMTGMF',
      '765db6917d5c17449984f7c0067ae04c'
    );
    
    autocomplete({
      container: '#autocomplete',
      debug: true, // FIXME: remove
      placeholder: 'Search for problems or areas',
      getSources({ query }) {
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
                    __html: `<span>
                    ${item._highlightResult.name.value}
                    </span>`,
                  },
                });
              },
              // header({ items }) {
              //   if (items.length === 0) {
              //     return null;
              //   }
              //   return `Secteurs`
              // },
            },

            // getItemInputValue({ item }) {
            //     return item.name;
            //   },

            getItemUrl({ item }) {
              var locale = "fr"
              return `/${locale}/fontainebleau/${item.slug}`
            },

            onSelect({ item }) {
              // FIXME: store url inside algolia attribute, and handle locale
              var locale = "fr"
              document.location.href=`/${locale}/fontainebleau/${item.slug}`
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
                return createElement('div', {
                  dangerouslySetInnerHTML: {
                    __html: `<span>
                    ${item._highlightResult.name.value}
                    </span>
                    <span class="ml-2 text-gray-300">
                      ${item.area_name}
                    </span>`,
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
              noResults() {
                return 'No results';
              },
            },

            // getItemInputValue({ item }) {
            //     return item.name;
            //   },

            getItemUrl({ item }) {
              var locale = "fr"
              return `/${locale}/fontainebleau/${item.area_slug}/${item.objectID}`
            },

            onSelect({ item }) {
              // FIXME: store url inside algolia attribute, and handle locale
              var locale = "fr"
              document.location.href=`/${locale}/fontainebleau/${item.area_slug}/${item.objectID}`
            },

            

          },

          


        ];
      },
    });

  }
}