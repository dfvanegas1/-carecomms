// app/javascript/controllers/edit_shifts_controller.js
import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["form", "start", "end", "editButton", "shiftDetails"]

  connect() {
    console.log("Edit shifts controller connected");
  }

  showForm(event) {
    event.preventDefault();
    this.shiftDetailsTarget.classList.add("hidden");
    this.formTarget.classList.remove("hidden");
  }

  updateShift(event) {
    event.preventDefault();

    let formData = new FormData(this.formTarget);
    let url = this.formTarget.action;

    Rails.ajax({
      url: url,
      type: "PATCH",
      data: formData,
      success: (_data) => {
        // Update the UI or notify the user upon success
        console.log("Shift updated successfully");
        // Optionally, hide the form and show the updated details
        this.formTarget.classList.add("hidden");
        this.shiftDetailsTarget.classList.remove("hidden");
      },
      error: (err) => {
        console.log("Error updating shift:", err);
      },
    });
  }
}
