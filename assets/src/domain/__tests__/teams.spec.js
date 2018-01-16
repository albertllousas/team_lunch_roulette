import { saveTeam, Team } from '../teams';
import mockAxios from 'jest-mock-axios';

describe('teams', () => {

  afterEach(() => {
    // cleaning up the mess left behind the previous test
    mockAxios.reset();
  });

  test('team instance should be created with the expected properties', () => {
    let team = new Team('Magnet', 'TW', 'BCN');
    expect(team.address).toEqual('BCN');
    expect(team.company).toEqual('TW');
    expect(team.name).toEqual('Magnet');
  });


  test('saving a team should make an http post with the expected params', () => {
    let team = new Team('Magnet', 'TW', 'BCN');
    saveTeam(team);
    expect(mockAxios.post)
      .toHaveBeenCalledWith('/api/teams', {"address": "BCN", "company": "TW", "key": null, "name": "Magnet"}, {});

  });

});