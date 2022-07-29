import { Controller } from "@hotwired/stimulus";
import debounce from "debounce";

// Connects to data-controller="search"
export default class extends Controller {
  initialize() {
    this.submit = debounce(this.submit.bind(this), 300);
  }
  connect() {
    console.log('Search');
  }

  submit(_event) {
    this.element.requestSubmit();
  }
}
