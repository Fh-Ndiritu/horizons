import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ["msgforms", "actionButton"]
  static classes = ["view"]

  connect() {
    document.addEventListener('turbo:before-stream-render', (event) => {
      const frame = event.detail.newStream;
      if (frame.target.includes("message")) {
        this.cancelEdit()
      }
      });
  }
  
  toggleforms() {
    this.msgformsTarget.classList.add("editing")
  }

  mouseEnter() {
   alert("hey")
 }
  
  cancelEdit() {
    this.msgformsTarget.classList.remove("editing")
  }
  
}