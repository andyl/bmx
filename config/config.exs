# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :bmx01,
  ecto_repos: [Bmx01.Repo]

config :bmx_web,
  ecto_repos: [Bmx01.Repo],
  generators: [context_app: :bmx]

# Configures the endpoint
config :bmx_web, BmxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ORcE+KhIl85f35XtuF4pvpUmvIayHw1P2AFx7Ij4uysYaoH2P/2ElY4AZM3xcti3",
  render_errors: [view: BmxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BmxWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

if Mix.env == :dev do
  config :mix_test_watch, clear: true
end
