import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log('I have connected to the navbar')
  };
  updateNavbar() {
    console.log(window.scrollY);
    console.log(window.innerHeight);
    if (window.scrollY >= 400) {
      this.element.classList.add("navbar-lewagon-blue")
    } else {
      this.element.classList.remove("navbar-lewagon-blue")
    }
  };
}
