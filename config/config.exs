# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :meals_report,
  ecto_repos: [MealsReport.Repo]
  config :meals_report, MealsReport.Repo, migration_primary_key: [type: :binary_id], migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :meals_report, MealsReportWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EcSB57/pEUPiUi349yE3308WFpLBtKHjYqp2TKrXggMMOeZSigyXPLsE58xAkIQ2",
  render_errors: [view: MealsReportWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: MealsReport.PubSub,
  live_view: [signing_salt: "eAMAJyiF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
