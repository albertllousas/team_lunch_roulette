defmodule TeamLunchRoulette.Mocks.Teams do

  alias TeamLunchRoulette.Team

  @behaviour TeamLunchRoulette.Teams

  def create(team = %Team{}) do
    {:ok, %Team{team | key: "new_key"}}
  end
end