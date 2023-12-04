import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="header"
export default class extends Controller {
  static targets = ["profile"]

  toggleProfile(e) {
    this.profileTarget.classList.toggle("active")
  }
}
