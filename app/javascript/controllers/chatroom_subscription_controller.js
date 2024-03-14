import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "list"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.insertMessageAndScrollDown(data) }
    )
    this.listTarget.scrollTo(0, this.listTarget.scrollHeight)
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.listTarget.scrollTo(0, this.listTarget.scrollHeight)
    console.log('trying jaja')
  }
  resetForm(event) {
    event.target.reset();

    const fileNameDisplay = document.querySelector("[data-file-upload-target='fileName']");
    if (fileNameDisplay) {
      fileNameDisplay.textContent = "";
    }
  }

}
