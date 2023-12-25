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
    // alert( this.msgformsTarget)
    // this.msgformsTarget.classList.add("editing")
  }

  showButtons() {
    this.actionButtonTargets.forEach(btn => { console.log(btn.classList); btn.classList.remove(this.viewClass)})
    this.actionButtonTarget.classList.add(this.viewClass)
  }
  
  cancelEdit() {
    // this.msgformsTarget.classList.remove("editing")
  }
  
}
