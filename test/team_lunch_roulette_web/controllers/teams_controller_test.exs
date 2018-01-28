defmodule TeamLunchRouletteWeb.TeamsControllerTest do
  use TeamLunchRouletteWeb.ConnCase

  @moduledoc """
  Here, instead of mock we just will use a predefined stub wired up in config/test.exs
  """

  test "POST /api/teams", %{conn: conn} do
    conn = post conn, "/api/teams", %{"name" => "magnet", "company" => "TW", "address" => "bcn"}
    assert json_response(conn, 200) == %{"name" => "magnet", "company" => "TW", "address" => "bcn", "key" => "new_key"}
  end


end
