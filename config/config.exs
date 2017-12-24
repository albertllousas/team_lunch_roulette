# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :team_lunch_roulette,
  ecto_repos: [TeamLunchRoulette.Repo]

# Configures the endpoint
config :team_lunch_roulette, TeamLunchRouletteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0zO9+LtkOdQ54ZFIyObHLIw/SsVJyBuIhDOdvhZZrUjFnkxmSKVjm46zxLh4eeEW",
  render_errors: [view: TeamLunchRouletteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TeamLunchRoulette.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
