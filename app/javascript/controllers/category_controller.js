import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category"
export default class extends Controller {
  connect() {
    console.log(this.element)
  }

  clickedCategory(event){
    let category = event.currentTarget.innerText
    let partial = document.querySelector(`.${category}`)
    let active_partial= document.querySelector(".active")
    active_partial.classList.add("inactive")
    active_partial.classList.remove("active")
    partial.classList.remove("inactive")
    partial.classList.add("active")
    console.log(partial)
    console.log(category)

  }




}
