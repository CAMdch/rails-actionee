import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["gain"]
  static values = {number: String}

  connect() {
     if (this.numberValue.substr(0, 1) === "-") {
       this.gainTarget.classList.remove("total-gain-green")
       this.gainTarget.classList.add("total-gain-red")
     } else {
      this.gainTarget.classList.remove("total-gain-red")
      this.gainTarget.classList.add("total-gain-green")
     }
  }


}
