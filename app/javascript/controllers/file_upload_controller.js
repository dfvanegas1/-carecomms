import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fileName"]

  displayFileName(event) {
    const input = event.target
    const fileName = input.files.length > 0 ? input.files[0].name : '';
    this.fileNameTarget.textContent = fileName;
  }
}
