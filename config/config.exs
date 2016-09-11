# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :testing_with_phoenix,
  ecto_repos: [TestingWithPhoenix.Repo]

# Configures the endpoint
config :testing_with_phoenix, TestingWithPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q1bAPbs1yxOY8rHhfFQVa7dUI1HwHhHeA1YKAzmLKsilJ79vMC49S4027DgUU0XW",
  render_errors: [view: TestingWithPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TestingWithPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
