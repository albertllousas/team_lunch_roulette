import { shallow, mount } from 'vue-test-utils'
import App from '../App.vue'
import NavBar from '../components/common/NavBar.vue';
import HomeHeader from '../components/common/Header.vue';

describe('App', () => {
  test('is a Vue instance', () => {
    const wrapper = shallow(App)
    expect(wrapper.isVueInstance()).toBeTruthy()
  })

  test('expected structure', () => {
    const wrapper = shallow(App)
    expect(wrapper.find('div#app').exists()).toBeTruthy()
    expect(wrapper.find('router-view').exists()).toBeTruthy()
    expect(wrapper.contains(NavBar)).toBeTruthy()
    expect(wrapper.contains(HomeHeader)).toBeTruthy()
  })
})