import { Controller } from "stimulus"

export default class extends Controller {
  updateNavbar() {
    var lastScroll = window.scrollY;
      console.log(lastScroll);

      console.log(window.scrollY);
    // if (window.scrollY >= 250) {
    //   this.element.classList.add("nav--hidden")
    // } else {
    //   this.element.classList.remove("nav--hidden")
    // }
    if (lastScroll <= window.scrollY) {
      console.log("We are going down");
    } else {
      console.log("we are going up");
    }

    lastScroll = window.scrollY;

  };
}
