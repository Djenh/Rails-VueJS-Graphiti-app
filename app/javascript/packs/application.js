import Vue from 'vue'
import App from '../App.vue'
import router from '../router'
import store from '../store'


Vue.config.productionTip = false

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    router,
    store,
    el,
    render: h => h(App)
  })

  // console.log(app)
})
