import router from '../router.js';
import HomeForm from '../components/teams/Form.vue';
import HomeHeader from '../components/common/HomeHeader.vue';
import EmptyHeader from '../components/common/EmptyHeader.vue';
import RestaurantForm from '../components/restaurants/Form.vue';

describe('VueRouter', () => {

  test('number of configured routes', () => {
    expect(router.options.routes).toHaveLength(2);
  });

  test('resolve default route "/"', () => {
    expect(router.getMatchedComponents('/')).toHaveLength(2);
    expect(router.getMatchedComponents('/')[0]).toBe(HomeHeader);
    expect(router.getMatchedComponents('/')[1]).toBe(HomeForm);
  });

  test('resolve adding restaurant route "/teams/:key/add-restaurant"', () => {
    expect(router.getMatchedComponents('/teams/12345/add-restaurant')).toHaveLength(2);
    expect(router.getMatchedComponents('/teams/12345/add-restaurant')[0]).toBe(EmptyHeader);
    expect(router.getMatchedComponents('/teams/12345/add-restaurant')[1]).toBe(RestaurantForm);
  });
});