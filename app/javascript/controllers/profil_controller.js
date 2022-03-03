import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["actionee", "overview", "btnactionee", "btnoverview"]

  connect() {


  }

  display(event) {

    if (event.currentTarget.dataset.choice === "overview") {
      this.actioneeTarget.classList.add("d-none")
      this.overviewTarget.classList.remove("d-none")

      this.btnactioneeTarget.classList.add("btn-unactive")
      this.btnactioneeTarget.classList.remove("btn-active")

      this.btnoverviewTarget.classList.remove("btn-unactive")
      this.btnoverviewTarget.classList.add("btn-active")

    } else {
      this.actioneeTarget.classList.remove("d-none")
      this.overviewTarget.classList.add("d-none")

      this.btnactioneeTarget.classList.remove("btn-unactive")
      this.btnactioneeTarget.classList.add("btn-active")

      this.btnoverviewTarget.classList.add("btn-unactive")
      this.btnoverviewTarget.classList.remove("btn-active")


    }
  }
}
