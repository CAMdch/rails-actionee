import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["advice", "pourcentage"]
  static values = {number: String}

  connect() {
    if (this.numberValue.substr(0, 1) === "+") {
      this.adviceTarget.classList.add("advice-green")
      this.pourcentageTarget.classList.add("pourcentage-value-green")

      this.adviceTarget.classList.remove("advice-red")
      this.pourcentageTarget.classList.remove("pourcentage-value-red")
    } else {
      this.adviceTarget.classList.remove("advice-green")
      this.pourcentageTarget.classList.remove("pourcentage-value-green")

      this.adviceTarget.classList.add("advice-red")
      this.pourcentageTarget.classList.add("pourcentage-value-red")
    }
  }


}
