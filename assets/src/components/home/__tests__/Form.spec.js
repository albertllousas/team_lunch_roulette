import { mount } from 'vue-test-utils';
import Component from '../Form.vue';
import Vue from 'vue';
import * as teams from '@/domain/teams';

const waitForValidation = async (numberOfUpdateCycles = 2) => {
  for (let i = 0; i < numberOfUpdateCycles; i++) {
    await Vue.nextTick();
  }
};

describe('Home - Form', () => {

  test('is a Vue instance', () => {
    const wrapper = mount(Component);
    expect(wrapper.isVueInstance()).toBeTruthy();
  });

  test('initial data is empty', () => {
    const wrapper = mount(Component);
    expect(wrapper.vm.$data).toEqual({'address': '', 'company': '', 'isLoading': false, 'team': ''});
  });

  test('data is bound to input fields', () => {
    const wrapper = mount(Component);

    wrapper.setData({'address': 'bcn', 'company': 'TW', 'team': 'magnet'});

    expect(wrapper.find('input[name="team"]').element.value).toEqual('magnet');
    expect(wrapper.find('input[name="company"]').element.value).toEqual('TW');
    expect(wrapper.find('textarea[name="address"]').element.value).toEqual('bcn');
  });

  test('method \'validateBeforeSubmit\' is called when form is submitted', () => {
    const validateBeforeSubmit = jest.fn();
    const wrapper = mount(Component, {
      methods: {validateBeforeSubmit}
    });
    wrapper.find('form').trigger('submit');
    expect(validateBeforeSubmit).toHaveBeenCalled();
  });

  test('inputs show errors when form is submitted with invalid form fields', async () => {
    const wrapper = mount(Component);
    wrapper.find('form').trigger('submit');
    await waitForValidation();
    expect(wrapper.find('input[name="team"]').hasClass('is-danger')).toBeTruthy();
    expect(wrapper.find('input[name="company"]').hasClass('is-danger')).toBeTruthy();
    expect(wrapper.find('textarea[name="address"]').hasClass('is-danger')).toBeTruthy();
  });

  test('data isLoading becomes true when form is submitted with a valid form fields', async () => {
    const wrapper = mount(Component);
    wrapper.setData({'address': 'bcn', 'company': 'TW', 'team': 'magnet'});
    wrapper.find('form').trigger('submit');

    await waitForValidation(4);
    expect(wrapper.vm.$data.isLoading).toBeTruthy();

  });

  test('create team is called when form is submitted with a valid form fields', async () => {
    const wrapper = mount(Component);
    wrapper.setData({'address': 'bcn', 'company': 'TW', 'team': 'magnet'});
    wrapper.find('form').trigger('submit');
    teams.saveTeam = jest.fn()

    await waitForValidation(4);
    expect(teams.saveTeam).toBeCalledWith({});

  });

});