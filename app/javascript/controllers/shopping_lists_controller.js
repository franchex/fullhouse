import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-lists"
export default class extends Controller {
  static targets = ["listImput", "shoppingList", "form"]
  connect() {
  }

  newElement(event) {
    event.preventDefault();
    const input = this.lisInputTarget;

    if (input) {
      const new_list = `<li  data-action="click->shopping_lists#clickedShopping"">${input.value}</li>`
      this.taskListTarget.insertAdjacentHTML("afterbegin", new_list)
    }
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)

    })
  }

  clickedShopping(event) {
    console.log("hola");
    event.currentTarget.classList.toggle("checked")
    }
}
