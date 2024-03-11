import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ['calendar1', 'calendar2', 'button']

  connect() {
    console.log("connected");
  }

  showCalendar(event) {
    const calendarNumber = event.target.dataset.value;
    if (calendarNumber === "1") {
      this.showCalendar1();
    } else if (calendarNumber === "2") {
      this.showCalendar2();
    }
  }

  showCalendar1() {
    this.calendar1Target.classList.remove("d-none");
    this.calendar2Target.classList.add("d-none");

  }

  showCalendar2() {
    this.calendar1Target.classList.add('d-none');
    this.calendar2Target.classList.remove("d-none");
  }
}
