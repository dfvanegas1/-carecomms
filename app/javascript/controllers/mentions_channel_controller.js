// app/javascript/controllers/mentions_channel_controller.js

import { Controller } from "@hotwired/stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  connect() {
    this.subscription = consumer.subscriptions.create("MentionsChannel", {
      connected() {
        console.log("Connected to MentionsChannel");
      },
      disconnected() {
        console.log("Disconnected from MentionsChannel");
      },
      received(data) {
        const mentionsContainer = document.getElementById('mentions-container');
        mentionsContainer.innerHTML += data.mention;
      }
    });
  }

  disconnect() {
    this.subscription.unsubscribe();
  }
}
