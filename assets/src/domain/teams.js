import axios from 'axios';

const axiosParams = {};

class Team {
  constructor (team, company, address) {
    this.team = team;
    this.company = company;
    this.address = address;
  }
}

const saveTeam = async (team) => await axios.post('/api/teams', team, axiosParams);

export { Team, saveTeam };


