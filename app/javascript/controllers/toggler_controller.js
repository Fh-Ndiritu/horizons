import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggler"
export default class extends Controller {
    static targets = ["msgforms", "actionButton"]
    static classes = ["view"]


    showButton() {
     this.actionButtonTarget.classList.toggle(this.viewClass)
    }
  
  
  hideButton() {
      this.actionButtonTarget.classList.remove(this.viewClass)
    }
  
}
