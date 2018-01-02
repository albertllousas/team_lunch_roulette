import axios from 'axios';

const axiosParams = {};

class Team {
  constructor (team, company, address, key = null) {
    this.team = team;
    this.company = company;
    this.address = address;
    this.key = key;
  }
}

const saveTeam = async (team) => await axios.post('/api/teams', team, axiosParams);

export { Team, saveTeam };


