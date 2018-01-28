defmodule TeamLunchRouletteWeb.MapsController do
  use TeamLunchRouletteWeb, :controller

  alias TeamLunchRoulette.Team

  @maps Application.get_env(:team_lunch_roulette, :maps)

  def places(conn, %{"query" => query}) do
        places_response = @maps.places(query)

        case places_response do
          {:ok, result} ->
            json conn, result
          {:error, error, status} ->
            conn
            |> put_status(status)
            |> json(%{error: error})
        end
  end
end
