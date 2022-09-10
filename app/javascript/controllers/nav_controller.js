import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.lastScroll = window.scrollY;
  }
  updateNavbar() {

    // if (window.scrollY >= 250) {
    //   this.element.classList.add("nav--hidden")
    // } else {
    //   this.element.classList.remove("nav--hidden")
    // }
    if (this.lastScroll <= window.scrollY) {
      this.element.classList.add("nav--hidden")
    } else {
      this.element.classList.remove("nav--hidden")
    }

    this.lastScroll = window.scrollY;

  };
}
