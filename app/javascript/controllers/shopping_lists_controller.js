import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-lists"
export default class extends Controller {
  connect() {
    console.log("me conecte desde un controller de stimulus")
  }

  radioClick(event) {
    console.log("you just clicked me")
  }
}
