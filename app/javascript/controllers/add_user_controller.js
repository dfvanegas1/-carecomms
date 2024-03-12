import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select"]

  connect() {
    console.log("AddUser controller connected");
    this.selectTarget.style.display = 'none';
  }

  toggleSelect() {
    console.log("Toggle select called");
    // const style = this.selectTarget.style;
    // style.display = style.display === 'block' ? 'none' : 'block';
  }
}
