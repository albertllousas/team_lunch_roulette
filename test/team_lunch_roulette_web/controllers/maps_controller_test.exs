defmodule TeamLunchRouletteWeb.MapsControllerTest do
  use TeamLunchRouletteWeb.ConnCase, async: false

  import Mock

  @moduledoc """
  Here, we willl try mock library instead of stubbing
  """

  test "GET /api/maps/places", %{conn: conn} do
    with_mock TeamLunchRoulette.GoogleMapsProxy, [places: fn(_query) -> {:ok, []} end] do
      conn = get conn, "/api/maps/places", %{"query" => "come%20bien,barcelona"}
      assert json_response(conn, 200) == []
    end
  end

  test "GET /api/maps/places should fail when maps dependency return tuple with error", %{conn: conn} do
    with_mock TeamLunchRoulette.GoogleMapsProxy, [places: fn(_query) -> {:error, "", 500} end] do
      conn = get conn, "/api/maps/places", %{"query" => "come%20bien,barcelona"}
      assert json_response(conn, 500) == %{"error" => ""}
    end
  end


end
