import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggleButton", "filterSelect", "calendarAllShifts", "calendarMyShifts", "calendarAllTasks", "calendarMyTasks", "text", "icon"]
  static values = {
    isAdmin: Boolean
  }

  connect() {
    this.isAdminValue = this.data.get("is-admin") === "true";
    this.currentView = 'shifts';
    this.toggleCalendarView();
  }

  toggleCalendarView() {
    const buttonText = this.textTarget.textContent.trim();

    if (buttonText === "Shifts") {
      this.currentView = 'tasks';
      this.textTarget.textContent = "Tasks";
      if (!this.isAdminValue) {
        this.filterSelectTarget.classList.add("d-none");
      } else {
        this.filterSelectTarget.classList.remove("d-none");
        this.updateDropdown(["2", "All Tasks", "4", "My Tasks"]);
      }
    } else {
      this.currentView = 'shifts';
      this.textTarget.textContent = "Shifts";
      this.filterSelectTarget.classList.remove("d-none");
      this.updateDropdown(["1", "All Shifts", "3", "My Shifts"]);
    }

    this.defaultSelection();
  }



  updateDropdown(options) {
    this.filterSelectTarget.innerHTML = '';
    for (let i = 0; i < options.length; i += 2) {
        const option = document.createElement("option");
        option.value = options[i];
        option.text = options[i + 1];
        this.filterSelectTarget.appendChild(option);
    }
  }


  defaultSelection() {
    let value;

    if (this.isAdminValue) {
        value = this.currentView === 'tasks' ? "2" : "1";
    } else {
        value = this.currentView === 'tasks' ? "4" : "1";
    }

    this.showCalendar({ target: { value: value } });
  }


  showCalendar(event) {
    const calendarType = event.target.value;
    this.hideAllCalendars();

    switch (calendarType) {
      default:
        console.log(`Unhandled calendar type: ${calendarType}`);
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
    }
  }

  hideAllCalendars() {
    this.calendarAllShiftsTarget.classList.add("d-none");
    this.calendarMyShiftsTarget.classList.add("d-none");
    this.calendarAllTasksTarget.classList.add("d-none");
    this.calendarMyTasksTarget.classList.add("d-none");
  }
}
