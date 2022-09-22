# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :ratelimit, RatelimitWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: RatelimitWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Ratelimit.PubSub,
  live_view: [signing_salt: "dCuDENfS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Config the rate limiter
config :hammer,
backend: {Hammer.Backend.ETS, [expiry_ms: 60_000 * 60 * 4, cleanup_interval_ms: 60_000 * 10]}

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
