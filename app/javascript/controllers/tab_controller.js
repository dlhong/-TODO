import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["section"]

  show(event) {
    event.preventDefault()
    const tabId = event.currentTarget.id
    if (tabId == "Overview") {
      this.sectionTargets.forEach((section) => {
        section.classList.remove("d-none")
      })
    } else {
      this.sectionTargets.forEach((section) => {
        section.classList.add("d-none")
        if (section.id == tabId) {
          section.classList.remove("d-none")
        }
      })

    }
  }
}
