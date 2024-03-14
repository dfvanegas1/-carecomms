// profile_controller.js

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile"
export default class extends Controller {
  static targets = ['btnTasks', 'btnShifts', 'shifts', 'tasks']

  connect() {
    this.btnShiftsTarget.classList.add('selected')
    // console.log("connected");
  }

  display(event) {
    const viewNumber = event.target.dataset.value;
      if (viewNumber === "1") {
        this.btnShiftsTarget.classList.add('selected')
        this.btnTasksTarget.classList.remove('selected')
        this.displayShifts();
      } else if (viewNumber === "2") {
        this.displayTasks();
        this.btnTasksTarget.classList.add('selected')
        this.btnShiftsTarget.classList.remove('selected')
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
