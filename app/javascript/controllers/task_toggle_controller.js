import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { url: String }

  updateCompletion() {
    fetch(this.urlValue, {
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").getAttribute("content"),
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: JSON.stringify({
        completed: this.checkboxTarget.checked
      }),
    })
    .then(response => {
      if (!response.ok) throw new Error('Network response was not ok.');
      console.log("Task updated successfully");
      if (this.checkboxTarget.checked) {
        this.element.classList.add("task-completed");
      } else {
        this.element.classList.remove("task-completed");
      }
    })
    .catch(error => console.error("Failed to update task:", error));
  }

  get checkboxTarget() {
    return this.targets.find("checkbox");
  }
}
