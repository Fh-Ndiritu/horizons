import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="conversations"
export default class extends Controller {
  static targets = ["chat", "query", "submit"]

  connect() {
    this.chatTarget.click()
  }

  search() {
    if (this.queryTarget.value.length > 3 || this.queryTarget.value.length == 0) {
      this.submitTarget.click()
    }
  }
}
