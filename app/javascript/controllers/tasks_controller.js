import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  static targets = ["taskInput", "taskList", "form"]
  static values = {
    action: String
  }
  connect() {
    console.log("Hello form task controller");
  }

  submitTaskForm(event) {
    event.preventDefault();
    console.log(this.formTarget)
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    }).then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.inserted_item) {
          console.log("hola desde insert item");
          this.taskListTarget.insertAdjacentHTML("afterbegin", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }

  clickedTask(event) {
    event.currentTarget.classList.toggle("checked")
  }

  deleteTask(event){
    event.preventDefault();
    const csrfToken = document.querySelector("meta[name=csrf-token]").content;
    fetch(event.target.dataset["taskId"], {
      method: "DELETE",
      headers: {
        'Content-Type': 'application/json',
        "Accept": "application/json",
        'X-CSRF-TOKEN': csrfToken},
        body: JSON.stringify({ space_id: event.target.dataset["spaceId"] })
    }).then(response => response.json())
      .then((data) => {
        this.updateTasks(event.target.dataset["spaceId"])
      })
  }

  updateTasks(spaceId) {
    fetch(`http://localhost:3000/users/${userId}/spaces/${spaceId}`, {
      method: "GET"
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    })
  }
}
