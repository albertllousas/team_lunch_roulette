defmodule TeamLunchRouletteWeb.TeamsControllerTest do
  use TeamLunchRouletteWeb.ConnCase

  test "POST /teams", %{conn: conn} do
    conn = post conn, "/api/teams", %{"team" => "magnet", "company" => "TW", "address" => "bcn"}
    assert json_response(conn, 200) == %{"team" => "magnet", "company" => "TW", "address" => "bcn"}
  end

end
