# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :track_record,
  ecto_repos: [TrackRecord.Repo]

# Configures the endpoint
config :track_record, TrackRecordWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fjXxOY5v42MT56FWS6j7YRW2/Io7QLn8w/65Rg52BAX7WJjVVhFtGqcrU3Mej9Ok",
  render_errors: [view: TrackRecordWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: TrackRecord.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
