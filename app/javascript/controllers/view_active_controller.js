import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["information", "finance", "btninformation", "btnfinance"]

  connect() {


  }

  display(event) {

    if (event.currentTarget.dataset.choice === "finance") {
      this.informationTarget.classList.add("d-none")
      this.financeTarget.classList.remove("d-none")

      this.btninformationTarget.classList.add("btn-unactive")
      this.btninformationTarget.classList.remove("btn-active")

      this.btnfinanceTarget.classList.remove("btn-unactive")
      this.btnfinanceTarget.classList.add("btn-active")

    } else {
      this.informationTarget.classList.remove("d-none")
      this.financeTarget.classList.add("d-none")

      this.btninformationTarget.classList.remove("btn-unactive")
      this.btninformationTarget.classList.add("btn-active")

      this.btnfinanceTarget.classList.add("btn-unactive")
      this.btnfinanceTarget.classList.remove("btn-active")


    }
  }
}
