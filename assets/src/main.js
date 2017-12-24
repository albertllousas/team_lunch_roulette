import Vue from 'vue'
import VueBlu from 'vue-blu'
import 'vue-blu/dist/css/vue-blu.min.css'
import App from './App.vue'


Vue.use(VueBlu)

new Vue({
  el: '#app',
  render: h => h(App) // createElement sugar
})
