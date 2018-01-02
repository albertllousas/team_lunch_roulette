defmodule TeamLunchRoulette.TeamsInMongo do

  alias TeamLunchRoulette.Team

  @behaviour TeamLunchRoulette.Teams

  def create(team = %Team{}) do

    team_with_new_key = %Team{team | key: SecureRandom.uuid}

    case Mongo.insert_one(:mongo, "teams", team_with_new_key, pool: DBConnection.Poolboy) do
      {:ok, _} -> {:ok, team_with_new_key}
      {:error, error} -> {:error, error}
    end

  end
end