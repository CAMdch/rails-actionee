import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "form", "list", "graph"]

  connect() {
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }


}
