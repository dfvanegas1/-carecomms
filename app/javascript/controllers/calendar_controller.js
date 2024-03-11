import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["calendarAllShifts", "calendarMyShifts", "calendarAllTasks", "calendarMyTasks"]

  connect() {
    console.log("Calendar controller connected");
  }

  showCalendar(event) {
    const calendarType = event.target.value;
    this.hideAllCalendars();

    switch (calendarType) {
      case "1":
        this.calendarAllShiftsTarget.classList.remove("d-none");
        break;
      case "2":
        this.calendarAllTasksTarget.classList.remove("d-none");
        break;
      case "3":
        this.calendarMyShiftsTarget.classList.remove("d-none");
        break;
      case "4":
        this.calendarMyTasksTarget.classList.remove("d-none");
        break;
      default:
        console.log("Invalid calendar type");
    }
  }


  hideAllCalendars() {
    this.calendarAllShiftsTarget.classList.add("d-none");
    this.calendarMyShiftsTarget.classList.add("d-none");
    this.calendarAllTasksTarget.classList.add("d-none");
    this.calendarMyTasksTarget.classList.add("d-none");
  }
}
