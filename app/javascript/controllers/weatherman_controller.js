import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  disconnect(){
    this.buttonTarget.innerHTML = 'Get Forecast'
    this.buttonTarget.classList.add('bg-indigo-600')
    this.buttonTarget.classList.remove('bg-indigo-700')
  }

  submit(e) {
    this.buttonTarget.innerHTML = 'Searching ...'
    this.buttonTarget.classList.add('bg-indigo-700')
    this.buttonTarget.classList.remove('bg-indigo-600')
  }
}
