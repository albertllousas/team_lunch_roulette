defmodule TeamLunchRouletteWeb.TeamsController do
  use TeamLunchRouletteWeb, :controller

  alias TeamLunchRoulette.Team

  @teams Application.get_env(:team_lunch_roulette, :teams)

  def create(conn, %{"name" => team, "company" => company, "address" => address}) do
    team = %Team{name: team, company: company, address: address}

    case @teams.create(team) do
      {:ok, new_team} ->
        json conn, new_team
      {:error, error} ->
        conn
        |> put_status(500)
        |> json(%{error: error.message})
    end
  end
end
