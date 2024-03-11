// app/javascript/controllers/shift_updates_controller.js
import { Controller } from "@hotwired/stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { userId: Number } // Use this to access the current user's ID

  connect() {
    this.channel = consumer.subscriptions.create({ channel: "ShiftsChannel", user_id: currentUserId }, {
      received: data => {
        if(data.user_id === this.userIdValue) {
          // Update the UI with the new shift information for the current_user
          this.updateShiftsContainer(data);
        }
      }
    });
  }

  updateShiftsContainer(data) {
    const shiftsContainer = document.getElementById('shifts-container');
    // Example: Replace the innerHTML or append new shift information
    // Modify this according to how you want to display the shifts
    shiftsContainer.innerHTML = `<p>Updated Shift: <strong>${data.shift_info}</strong></p>
                                 <p>Start: ${data.start_time}, End: ${data.end_time}</p>`;
  }

  incrementMentionsCount() {
    const mentionsCountElement = document.querySelector("#total-mentions");
    let currentCount = parseInt(mentionsCountElement.innerText, 10);
    mentionsCountElement.innerText = currentCount + 1;
  }

  disconnect() {
    this.channel.unsubscribe();
  }
}
