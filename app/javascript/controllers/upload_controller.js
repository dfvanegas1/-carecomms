import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fileMessage"]

  showAttachmentMessage(event) {
    const input = event.target
    if (input.files && input.files[0]) {
      const fileType = input.files[0].type.startsWith('image/') ? 'img' : 'PDF'
      this.fileMessageTarget.textContent = `Attached ${fileType}...`
    }
  }
}
