use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :team_lunch_roulette,
       TeamLunchRouletteWeb.Endpoint,
       http: [
         port: 4001
       ],
       server: false

# Print only warnings and errors during test
config :logger, level: :warn

# mocking services
config :team_lunch_roulette, teams: TeamLunchRoulette.Mocks.Teams

# repository
config :team_lunch_roulette, :db,
       name: "my_mongo_test"

# Configure your database
#config :team_lunch_roulette,
#       TeamLunchRoulette.Repo,
#       adapter: Ecto.Adapters.Postgres,
#       username: "postgres",
#       password: "postgres",
#       database: "team_lunch_roulette_test",
#       hostname: "localhost",
#       pool: Ecto.Adapters.SQL.Sandbox
