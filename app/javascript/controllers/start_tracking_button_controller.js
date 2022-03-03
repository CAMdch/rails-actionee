import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["button", "form", "cross"]
  connect() {
    console.log("Hello from start tracking button ")
  }

  appear(event) {
    console.log(event)

    this.formTarget.classList.remove("d-none")
    this.buttonTarget.classList.add("d-none")
  }

  canceltrack(event) {
    this.formTarget.classList.add("d-none")
    this.buttonTarget.classList.remove("d-none")
  }
}
