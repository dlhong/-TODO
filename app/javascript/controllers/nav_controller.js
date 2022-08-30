import { Controller } from "stimulus"

export default class extends Controller {
  updateNavbar() {
      console.log(window.scrollY);
      console.log(window.innerHeight);
    if (window.scrollY >= 250) {
      this.element.classList.add("nav--hidden")
    } else {
      this.element.classList.remove("nav--hidden")
    }
  };
}
