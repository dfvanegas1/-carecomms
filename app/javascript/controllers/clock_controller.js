import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output"]

  connect() {
    this.updateTime();
    this.timer = setInterval(() => this.updateTime(), 1000);
  }

  disconnect() {
    clearInterval(this.timer);
  }

  updateTime() {
    const now = new Date();
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const seconds = now.getSeconds().toString().padStart(2, '0');
    this.outputTarget.textContent = `${hours}:${minutes}:${seconds}`;
  }
}
