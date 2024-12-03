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
  return fetch(`/search?${searchParams.toString()}`).then(res => res.json());
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

function bgColor(sector_color) {
  return colorMapping[sector_color] || "rgb(80% 80% 80%)";
}

function textColor(sector_color) {
  return sector_color === "white" ? "#333" : "#FFF";
}

export default class extends Controller {
  static targets = [
    "searchInput",
    "searchDropdown",
    "searchResults",
    "searchIcon",
    "spinnerIcon",
    "cancelButton",
    "clearButton",
    "searchModal"
  ];

  static values = {
    locale: String,
    debug: Boolean,
    placeholder: String,
    clear: String,
    cancel: String,
    submit: String,
    showUnpublished: { type: Boolean, default: false }
  };

  connect() {
    this.searchInputTarget.value = "";
    this.locale = this.hasLocaleValue ? this.localeValue : "en";
    this.showUnpublished = this.showUnpublishedValue;
    this._activeDescendant = '';
    this.updatingResults = false;
  }

  get activeDescendant() {
    return this._activeDescendant;
  }

  set activeDescendant(value) {
    if (this._activeDescendant) {
      const prevElement = document.getElementById(this._activeDescendant);
      if (prevElement) {
        prevElement.classList.remove('bg-emerald-600/10');
        prevElement.setAttribute('aria-selected', 'false');
      }
    }

    this._activeDescendant = value;

    if (this._activeDescendant) {
      const newElement = document.getElementById(this._activeDescendant);
      if (newElement) {
        newElement.classList.add('bg-emerald-600/10');
        newElement.setAttribute('aria-selected', 'true');
      }
    }
  }

  async performSearch() {
    const query = this.searchInputTarget.value.trim();

    this.searchResultsTarget.classList.add('!text-gray-400', 'grayscale', 'filter');

    if (query.length) {
      this.searchIconTarget.classList.add("hidden");
      this.spinnerIconTarget.classList.remove("hidden");
      this.clearButtonTarget.classList.remove("hidden");
    }

    const results = await debouncedFetch(query, 
      this.showUnpublished ? { show_unpublished: true } : {});

    this.searchResultsTarget.classList.remove('!text-gray-400', 'grayscale', 'filter');

    if (query.length === 0) {
      this.clearResults();
      return;
    }

    this.searchIconTarget.classList.remove("hidden");
    this.spinnerIconTarget.classList.add("hidden");

    this.updateResults(results);
  }

  updateResults(results) {
    this.searchResultsTarget.innerHTML = "";

    this.disableMouseEvents = true;

    results.forEach((item) => {
      const li = document.createElement("li");
      li.className = "select-none px-4 py-2";
      li.id = `option-${item.id}`;
      li.role = "option";
      li.tabIndex = "-1";
      li.setAttribute('aria-selected', 'false');

      li.innerHTML = this.renderItem(item);

      li.addEventListener("click", () => this.handleResultClick(item));
      li.addEventListener("mouseenter", () => this.handleMouseEnter(li));
      li.addEventListener("mouseleave", () => this.handleMouseLeave());

      this.searchResultsTarget.appendChild(li);
    });

    setTimeout(() => {
      this.disableMouseEvents = false;
    }, 100);

    if (results.length > 0) {
      this.searchDropdownTarget.classList.remove("hidden");
      this.searchInputTarget.setAttribute("aria-expanded", "true");
      this.searchInputTarget.setAttribute("aria-activedescendant", this.activeDescendant);
    } else {
      this.searchDropdownTarget.classList.add("hidden");
      this.searchInputTarget.setAttribute("aria-expanded", "false");
      this.searchInputTarget.setAttribute("aria-activedescendant", '');
    }
  }

  handleMouseEnter(li) {
    if (!this.disableMouseEvents) {
      this.activeDescendant = li.id;
    }
  }

  handleMouseLeave() {
    if (!this.disableMouseEvents) {
      this.activeDescendant = '';
    }
  }

  renderItem(item) {
    if (item.type === "Problem") {
      return `
        <div class="flex justify-between items-center">
          <div class="flex items-center">
            <span style="background: ${bgColor(item.sector_color)}; color: ${textColor(item.sector_color)}" class="rounded-full h-6 w-6 leading-6 inline-flex justify-center flex-shrink-0">
              ${item.sector_number || "&nbsp;"}
            </span>
            <span class="ml-2">${item.name}</span>
            <span class="ml-2 text-gray-400">${item.grade}</span>
          </div>
          <span class="ml-2 text-gray-400 flex-shrink-0">${item.area_name}</span>
        </div>
      `;
    } else {
      return item.name;
    }
  }

  handleResultClick(item) {
    const event = new CustomEvent(item.type === "Area" ? "gotoarea" : "gotoproblem", {
      detail: this.createDetail(item)
    });
    window.dispatchEvent(event);
    this.closeModal();
  }

  createDetail(item) {
    if (item.type === "Area") {
      return {
        id: item.id,
        name: item.name,
        south_west_lat: item.bounds.south_west.lat,
        south_west_lon: item.bounds.south_west.lng,
        north_east_lat: item.bounds.north_east.lat,
        north_east_lon: item.bounds.north_east.lng,
      };
    } else {
      return {
        id: item.id,
        name: item.name,
        grade: item.grade,
        lat: item.geolocation.lat,
        lon: item.geolocation.lng
      };
    }
  }

  handleKeydown(event) {
    const { key } = event;

    if (key === "ArrowDown" || key === "ArrowUp") {
      this.moveFocus(key === "ArrowDown");
      event.preventDefault();
    } else if (key === "Enter" && this.activeDescendant) {
      const selectedElement = document.getElementById(this.activeDescendant);
      selectedElement.click();
    } else if (key === "Escape") {
      this.closeModal();
    }
  }

  moveFocus(down) {
    const options = Array.from(this.searchResultsTarget.children);
    let currentIndex = options.findIndex(option => option.id === this.activeDescendant);

    if (down) {
      currentIndex = (currentIndex + 1) % options.length;
    } else {
      currentIndex = (currentIndex - 1 + options.length) % options.length;
    }

    this.activeDescendant = options[currentIndex].id;
    this.searchInputTarget.setAttribute("aria-activedescendant", this.activeDescendant);
  }

  openModal(event) {
    event.stopPropagation();
    const modal = this.searchModalTarget;
    modal.classList.remove("hidden");
    document.body.style.overflow = "hidden";
    this.searchInputTarget.focus();
    document.addEventListener("click", this.closeModal.bind(this));
    this.searchInputTarget.setAttribute("aria-expanded", "true");
  }

  closeModal(event) {
    const modal = this.searchModalTarget;
    const searchDropdown = this.searchDropdownTarget;

    if (!event || (!this.searchInputTarget.contains(event.target) && !searchDropdown.contains(event.target))) {
      modal.classList.add("hidden");
      document.body.style.overflow = "";
      document.removeEventListener("click", this.closeModal.bind(this));
      this.searchInputTarget.setAttribute("aria-expanded", "false");
    }
  }

  clearSearch(event) {
    event.stopPropagation();
    this.searchInputTarget.value = "";
    this.searchInputTarget.focus();
    this.searchDropdownTarget.classList.add("hidden");
    this.clearButtonTarget.classList.add("hidden");
    this.searchInputTarget.setAttribute("aria-expanded", "false");
  }

  clearResults() {
    this.searchResultsTarget.innerHTML = "";
    this.searchDropdownTarget.classList.add("hidden");
    this.spinnerIconTarget.classList.add("hidden");
    this.clearButtonTarget.classList.add("hidden");
    this.searchIconTarget.classList.remove("hidden");
    this.activeDescendant = '';
    this.searchInputTarget.setAttribute("aria-expanded", "false");
    this.searchInputTarget.setAttribute("aria-activedescendant", '');
  }
}
