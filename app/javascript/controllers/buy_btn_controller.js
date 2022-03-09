import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["buy", "sell", "form", "formsell", "formloss", "cross", "unfollow"]
  connect() {

  }

  appearLoss(event) {
    this.formlossTarget.classList.remove("d-none")
    this.buyTarget.classList.add("d-none")
    this.sellTarget.classList.add("d-none")
    this.unfollowTarget.classList.add("d-none")
  }

  appearBuy(event) {

    this.formTarget.classList.remove("d-none")
    this.buyTarget.classList.add("d-none")
    this.sellTarget.classList.add("d-none")
    this.unfollowTarget.classList.add("d-none")
  }

  appearSell(event) {
    this.formsellTarget.classList.remove("d-none")
    this.buyTarget.classList.add("d-none")
    this.sellTarget.classList.add("d-none")
    this.unfollowTarget.classList.add("d-none")
  }

  cancelbuy(event) {
    this.formTarget.classList.add("d-none")
    this.formsellTarget.classList.add("d-none")
    this.buyTarget.classList.remove("d-none")
    this.sellTarget.classList.remove("d-none")
    this.unfollowTarget.classList.remove("d-none")
  }

  cancelsell(event) {
    this.formsellTarget.classList.add("d-none")
    this.formsellTarget.classList.add("d-none")
    this.buyTarget.classList.remove("d-none")
    this.sellTarget.classList.remove("d-none")
    this.unfollowTarget.classList.remove("d-none")
  }

  cancelloss(event) {
    this.formlossTarget.classList.add("d-none")
    this.buyTarget.classList.remove("d-none")
    this.sellTarget.classList.remove("d-none")
    this.unfollowTarget.classList.remove("d-none")
  }
}
