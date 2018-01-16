import { mount } from 'vue-test-utils'
import Component from '../Header.vue'

describe('Home - Header', () => {
  test('is a Vue instance', () => {
    const wrapper = mount(Component)
    expect(wrapper.isVueInstance()).toBeTruthy()
  })
})