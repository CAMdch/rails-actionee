import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["buy", "sell", "form", "formsell", "cross"]
  connect() {
    console.log("Hello from buy button ")
  }

  appearBuy(event) {

    this.formTarget.classList.remove("d-none")
    this.buyTarget.classList.add("d-none")
    this.sellTarget.classList.add("d-none")
  }

  appearSell(event) {
    this.formTarget.classList.remove("d-none")
    this.buyTarget.classList.add("d-none")
    this.sellTarget.classList.add("d-none")

  }

  cancelbuy(event) {
    this.formTarget.classList.add("d-none")
    this.buyTarget.classList.remove("d-none")
    this.sellTarget.classList.remove("d-none")
  }

  cancelsell(event) {
    this.formsellTarget.classList.add("d-none")
    this.buyTarget.classList.remove("d-none")
    this.sellTarget.classList.remove("d-none")
  }
}
