import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["pourcentage"]
  static values = {number: String}

  connect() {

    if (this.numberValue.substr(0, 1) === "-") {
      this.pourcentageTarget.classList.remove("company-pourcentage-green")
      this.pourcentageTarget.classList.add("company-pourcentage-red")
    } else {
      this.pourcentageTarget.classList.add("company-pourcentage-green")
      this.pourcentageTarget.classList.remove("company-pourcentage-red")
    }
  }


}
