import Vue from 'vue';
import VueBlu from 'vue-blu';
import 'vue-blu/dist/css/vue-blu.min.css';
import App from './App.vue';
import VueRouter from 'vue-router';
import router from './router';

Vue.use(VueRouter);
Vue.use(VueBlu);

new Vue({
  el: '#app',
  router,
  render: h => h(App)
});
