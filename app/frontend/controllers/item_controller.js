import { Controller } from "stimulus"
import axios from "axios"

export default class extends Controller {
  static targets = ["icon"]

  initialize() {
    this.clicked = false;
  }

  heart(e) {
    e.preventDefault();

    const csrfToken = document.querySelector('[name=csrf-token]').content
    axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken

    let item_id = document.querySelector('#item_id').Value;

    axios.post(`/api/v1/items/${item_id}/favorite`)
         .then(resp => {
           if (resp.data.status === 'favorited') {
             this.iconTarget.classList.remove('far');
             this.iconTarget.classList.add('fas');
           } else {
             this.iconTarget.classList.remove('fas');
             this.iconTarget.classList.add('far');
           }
         })
         .catch(function(err){
           console.log(err);
         })

    // api request

    // if (this.clicked) {
    //   this.iconTarget.classList.remove('fas')  // s = solid
    //   this.iconTarget.classList.add('far')     // r = regular
    //   this.clicked = false
    // } else {
    //   this.iconTarget.classList.remove('far')
    //   this.iconTarget.classList.add('fas')
    //   this.clicked = true
    // }
  }
}


