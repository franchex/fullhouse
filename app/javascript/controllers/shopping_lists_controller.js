import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-lists"
export default class extends Controller {
  connect() {
    console.log("me conecte desde un controller de stimulus")
  }

  newElement(event) {
    event.preventDefault();
    const input = this.myinputTarget;

    if (input && input.value !== '') {
      // Create a new list item when clicking on the "Add" button
      const li = document.createElement("li");
      const t = document.createTextNode(input.value);
      li.appendChild(t);
      let span = this.addCloseButtonOnLiItem();
      li.appendChild(span);
      li.dataset['action'] = this.initToggleCheck();
      this.mylistTarget.appendChild(li);
      this.myinputTarget.value = "";
      this.nbreTarget.textContent = parseInt(this.nbreTarget.textContent) + 1;
    }
  }

  clickedShopping(event) {
    event.currentTarget.classList.add("checked")
    }
}
