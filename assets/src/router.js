import TeamForm from './components/teams/Form.vue';
import HomeHeader from './components/common/HomeHeader.vue';
import EmptyHeader from './components/common/EmptyHeader.vue';
import RestaurantForm from './components/restaurants/Form.vue';
import VueRouter from 'vue-router';

const routes = [
  {
    path: '/',
    components: {
      header: HomeHeader,
      content: TeamForm
    }
  },
  {
    path: '/teams/:key/add-restaurant',
    components: {
      header: EmptyHeader,
      content: RestaurantForm
    }
  }
];

const router = new VueRouter({routes: routes});

export default router;