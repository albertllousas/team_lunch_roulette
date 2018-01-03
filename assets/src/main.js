import Vue from 'vue';
import VueBlu from 'vue-blu';
import 'vue-blu/dist/css/vue-blu.min.css';
import App from './App.vue';
import HomeForm from './components/home/Form.vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);
Vue.use(VueBlu);

const router = new VueRouter({
  routes: [
    {
      path: '/', component: HomeForm
    }
  ]
});

new Vue({
  el: '#app',
  router,
  render: h => h(App)
});
