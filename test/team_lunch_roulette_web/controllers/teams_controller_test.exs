defmodule TeamLunchRouletteWeb.TeamsControllerTest do
  use TeamLunchRouletteWeb.ConnCase

  test "POST /api/teams", %{conn: conn} do
    conn = post conn, "/api/teams", %{"name" => "magnet", "company" => "TW", "address" => "bcn"}
    assert json_response(conn, 200) == %{"name" => "magnet", "company" => "TW", "address" => "bcn", "key" => "new_key"}
  end


end
