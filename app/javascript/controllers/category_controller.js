import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category"
export default class extends Controller {
  next(event) {

  }

  clickedCategory(event){
    let category = event.currentTarget.innerText
    let partial = document.querySelector(`.${category}`)
    partial.classList.remove("inactive")
    console.log(partial)
    console.log(category)
  }




}
