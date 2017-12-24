defmodule TeamLunchRouletteWeb.PageController do
  use TeamLunchRouletteWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", layout: false
  end
end
