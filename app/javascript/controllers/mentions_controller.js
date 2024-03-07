// app/javascript/controllers/mentions_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "suggestions"]

  connect() {
    this.hideSuggestions();
  }

  keyup() {
    if (!this.inputTarget || !this.inputTarget.value) return;
    const inputVal = this.inputTarget.value;
    const lastWord = inputVal.split(" ").pop();

    if (lastWord.startsWith('@') && lastWord.length > 1) {
      const query = lastWord.substring(1);
      fetch(`/username_suggestions?query=${query}`)
        .then(response => response.json())
        .then(data => this.displaySuggestions(data));
    } else {
      this.hideSuggestions();
    }
  }

  displaySuggestions(data) {
    this.suggestionsTarget.innerHTML = data.map(username =>
      `<div data-action="click->mentions#selectSuggestion">${username}</div>`
    ).join('');
    this.suggestionsTarget.classList.remove('hidden');
  }

  hideSuggestions() {
    this.suggestionsTarget.classList.add('hidden');
  }

  selectSuggestion(event) {
    const username = event.target.textContent;
    const currentText = this.inputTarget.value;
    const newText = currentText.replace(/@\w*$/, `@${username} `);
    this.inputTarget.value = newText;
    this.hideSuggestions();
  }
}
