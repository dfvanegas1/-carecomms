import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    // console.log("Edit shifts controller connected");
    this.formTarget.classList.add("d-none");
  }

  showForm(event) {
    this.formTarget.classList.toggle("d-none");
  }

  }
