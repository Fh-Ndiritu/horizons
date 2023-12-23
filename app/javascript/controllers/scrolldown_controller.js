import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scrolldown"
export default class extends Controller {
  connect() {
    this.scrollBottom()
  }

  scrollBottom() {
    this.element.scrollIntoView({ behavior: "smooth", block: "end" })
  }
}
