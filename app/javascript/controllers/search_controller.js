import { Controller } from "@hotwired/stimulus";

function debouncePromise(fn, time) {
  let timerId;
  return function (...args) {
    if (timerId) clearTimeout(timerId);
    return new Promise(resolve => {
      timerId = setTimeout(() => resolve(fn(...args)), time);
    });
  };
}

const debouncedFetch = debouncePromise((query, params = {}) => {
  if (!query) return Promise.resolve(null);
  const searchParams = new URLSearchParams({ query, ...params });
  return fetch(`/api/v1/search?${searchParams.toString()}`).then(res => res.json());
}, 400);

const colorMapping = {
  yellow: "#FFCC02",
  purple: "#D783FF",
  orange: "#FF9500",
  green: "#77C344",
  blue: "#017AFF",
  skyblue: "#5AC7FA",
  salmon: "#FDAF8A",
  red: "#FF3B2F",
  black: "#000000",
  white: "#FFFFFF",
};

function bgColor(circuit_color) {
  return colorMapping[circuit_color] || "rgb(80% 80% 80%)";
}

function textColor(circuit_color) {
  return circuit_color === "white" ? "#333" : "#FFF";
}

export default class extends Controller {
  static values = {
    locale: String,
    debug: Boolean,
    placeholder: String,
    clear: String,
    cancel: String,
    submit: String,
    showUnpublished: { type: Boolean, default: false },
  };

  connect() {
    const searchId = this.element.getAttribute("data-search-id");
    this.searchInput = this.element.querySelector(`#search-input-${searchId}`);
    this.searchInput.value = "";
    this.searchDropdown = this.element.querySelector(`#search-dropdown-${searchId}`);
    this.searchResults = this.element.querySelector(`#search-results-${searchId}`);
    this.searchIcon = this.element.querySelector(`#search-icon-${searchId}`);
    this.spinnerIcon = this.element.querySelector(`#spinner-icon-${searchId}`);
    this.cancelButton = this.element.querySelector(`#cancel-button-${searchId}`);
    this.clearButton = this.element.querySelector(`#clear-button-${searchId}`);
    this.locale = this.hasLocaleValue ? this.localeValue : "en";
    this.showUnpublished = this.showUnpublishedValue;

    this.cancelButton.addEventListener("click", this.closeModal.bind(this));
    this.clearButton.addEventListener("click", (event) => {
      event.stopPropagation();
      this.searchInput.value = "";
      this.searchInput.focus();
      this.searchDropdown.classList.add("hidden");
      this.clearButton.classList.add("hidden");
    });

    this.searchInput.addEventListener("input", async (event) => {
      const query = this.searchInput.value.trim();
      if (query.length) {
        this.searchIcon.classList.add("hidden");
        this.spinnerIcon.classList.remove("hidden");
        this.clearButton.classList.remove("hidden");
      }

      const results = await debouncedFetch(query, {
        show_unpublished: this.showUnpublished,
      });

      if (query.length === 0) {
        this.searchResults.innerHTML = "";
        this.searchDropdown.classList.add("hidden");
        this.spinnerIcon.classList.add("hidden");
        this.clearButton.classList.add("hidden");
        this.searchIcon.classList.remove("hidden");
        return;
      }

      this.searchIcon.classList.remove("hidden");
      this.spinnerIcon.classList.add("hidden");

      this.searchResults.innerHTML = "";

      results.forEach((item) => {
        const li = document.createElement("li");
        li.className = "hover:bg-emerald-600/10 select-none px-4 py-2";
        li.id = `option-${item.id}`;
        li.role = "option";
        li.tabIndex = "-1";

        if (item.type === "Problem") {
          li.innerHTML = `
            <div class="flex justify-between items-center">
              <div class="flex items-center">
                <span style="background: ${bgColor(item.circuit_color)}; color: ${textColor(item.circuit_color)}" class="rounded-full h-6 w-6 leading-6 inline-flex justify-center flex-shrink-0">
                  ${item.circuit_number || "&nbsp;"}
                </span>
                <span class="ml-2">${item.name}</span>
                <span class="ml-2 text-gray-400">${item.grade}</span>
              </div>
              <span class="ml-2 text-gray-400 flex-shrink-0">${item.area_name}</span>
            </div>
          `;
        } else {
          li.textContent = item.name;
        }

        li.addEventListener("click", () => {
          const event = new CustomEvent(item.type === "Area" ? "gotoarea" : "gotoproblem", {
            detail: item.type === "Area" ? {
              id: item.id,
              name: item.name,
              south_west_lat: item.bounds.south_west.lat,
              south_west_lon: item.bounds.south_west.lng,
              north_east_lat: item.bounds.north_east.lat,
              north_east_lon: item.bounds.north_east.lng,
            } : {
              id: item.id,
              name: item.name,
              grade: item.grade,
              lat: item._geoloc.lat,
              lon: item._geoloc.lng
            }
          });
          window.dispatchEvent(event);
          this.closeModal();
        });

        this.searchResults.appendChild(li);
      });

      if (results.length > 0) {
        this.searchDropdown.classList.remove("hidden");
      } else {
        this.searchDropdown.classList.add("hidden");
      }
    });
  }

  openModal(event) {
    event.stopPropagation();
    const searchId = this.element.getAttribute("data-search-id");
    const modal = document.getElementById(`search-modal-${searchId}`);
    modal.classList.remove("hidden");
    document.body.style.overflow = "hidden";
    this.searchInput.focus();
    document.addEventListener("click", this.closeModal.bind(this));
  }

  closeModal(event) {
    const searchId = this.element.getAttribute("data-search-id");
    const modal = document.getElementById(`search-modal-${searchId}`);
    const searchInput = document.getElementById(`search-input-${searchId}`);
    const searchDropdown = document.getElementById(`search-dropdown-${searchId}`);

    if (!event || (!searchInput.contains(event.target) && !searchDropdown.contains(event.target))) {
      modal.classList.add("hidden");
      document.body.style.overflow = "";
      document.removeEventListener("click", this.closeModal.bind(this));
    }
  }
}
