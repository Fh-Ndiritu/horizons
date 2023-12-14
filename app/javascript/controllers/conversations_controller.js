import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="conversations"
export default class extends Controller {
  static targets = ["chat"]

  connect() {
    this.chatTarget.click()
  }
}
