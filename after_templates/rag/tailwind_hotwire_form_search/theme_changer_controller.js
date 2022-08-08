import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme-changer"
export default class extends Controller {
  connect() {
    // console.log('Theme Changer');
  }

  select(event) {
    var html = document.querySelector('html');
    html.setAttribute("data-theme", event.target.getAttribute('data-value'));
  }
}
