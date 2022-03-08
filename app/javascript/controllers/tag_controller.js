import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {params: Array}
  static targets = ["tag"]

  connect() {

    this.tagTargets.forEach((target) => {
      if (this.paramsValue.includes(target.textContent)) {
        target.classList.add("tag")
      } else {
        target.classList.remove("tag")
      }
    })
  }

}
