import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {

  }

  updateNavbar() {

    if(window.location.pathname === "/"){
      if (window.scrollY >= 400) {
        this.element.classList.add("navbar-lewagon-blue")
      } else {
        this.element.classList.remove("navbar-blue")
        this.element.classList.remove("navbar-lewagon-blue")
      }
    }
  };
}
