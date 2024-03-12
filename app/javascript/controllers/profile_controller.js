// profile_controller.js

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile"
export default class extends Controller {
  static targets = ['button', 'shifts', 'tasks']

  connect() {
    console.log("connected");
  }

  display(event) {
      const calendarNumber = event.target.dataset.value;
      if (calendarNumber === "1") {
        this.displayShifts();
      } else if (calendarNumber === "2") {
        this.displayTasks();
      }
    }

  displayShifts(event) {
    this.shiftsTarget.classList.remove('d-none')
    this.tasksTarget.classList.add('d-none')
  }

  displayTasks(event) {
    this.tasksTarget.classList.remove('d-none')
    this.shiftsTarget.classList.add('d-none')
  }
}
