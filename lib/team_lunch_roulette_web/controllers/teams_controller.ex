defmodule TeamLunchRouletteWeb.TeamsController do
  use TeamLunchRouletteWeb, :controller

  def create(conn, %{"team" => team, "company" => company, "address" => address}) do
    json conn, %{team: team, company: company, address: address}
  end
end
