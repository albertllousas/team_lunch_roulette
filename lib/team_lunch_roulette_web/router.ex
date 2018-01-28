defmodule TeamLunchRouletteWeb.Router do
  use TeamLunchRouletteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TeamLunchRouletteWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", TeamLunchRouletteWeb do
     pipe_through :api

     post "/teams", TeamsController, :create
     get "/maps/places", MapsController, :places
   end
end
