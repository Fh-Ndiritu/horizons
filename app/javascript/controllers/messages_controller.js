import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ["msgforms"]

  connect() {
  }
    toggleforms(e) {
    this.msgformsTarget.classList.add("editing")
  }
}
