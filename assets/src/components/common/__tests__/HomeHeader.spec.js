import { mount } from 'vue-test-utils'
import Component from '../HomeHeader.vue'

describe('Home - Header', () => {
  test('is a Vue instance', () => {
    const wrapper = mount(Component)
    expect(wrapper.isVueInstance()).toBeTruthy()
  })

  test('changeFood function is called after the component is mount', async () => {
    const changeFood = jest.fn();
    mount(Component, {
      methods: {changeFood}
    });

    // await Vue.nextTick();
    expect(changeFood).toHaveBeenCalled();

  });

})