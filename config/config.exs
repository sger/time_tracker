# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :time_tracker, ecto_repos: [TimeTracker.Repo]

# Configures the endpoint
config :time_tracker, TimeTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ri8ou+dkJHHG0RDKz92qDdOqTT5Oh+Zax2Jx2t7F9ObqhiD9kOAMCRd5/ki0I07w",
  render_errors: [view: TimeTrackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TimeTracker.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "TimeTracker",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "nMWWWyRh69hVhp7w8hFwE8qo6CvyF/QnkPlPy+VeHqYxbTazESLCSmxBFQMoT7q5",
  serializer: TimeTracker.GuardianSerializer
