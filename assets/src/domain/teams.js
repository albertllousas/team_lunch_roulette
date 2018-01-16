import axios from 'axios';

const axiosParams = {};

class Team {
  constructor (name, company, address, key = null) {
    this.name = name;
    this.company = company;
    this.address = address;
    this.key = key;
  }
}

const saveTeam = async (team) => {
  let response = await axios.post('/api/teams', team, axiosParams);
  return response.data
}

export { Team, saveTeam };


