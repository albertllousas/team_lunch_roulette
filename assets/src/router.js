import HomeForm from './components/teams/Form.vue';
import RestaurantForm from './components/restaurants/Form.vue';
import VueRouter from 'vue-router';


const routes = [
    { path: '/', component: HomeForm },
    { path: '/teams/:key/add-restaurant', component: RestaurantForm }
  ];

const router = new VueRouter({routes: routes});

export default router;