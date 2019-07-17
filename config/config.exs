use Mix.Config

# ----- MARCOM

config :bmx_marcom,
  generators: [context_app: false]

config :bmx_marcom, BmxMarcom.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qwer",
  render_errors: [view: BmxMarcom.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BmxMarcom.PubSub, adapter: Phoenix.PubSub.PG2],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: "."

config :bmx_marcom, BmxMarcom.Endpoint, live_view: [signing_salt: "asdf"]

# ----- BMX_WEB

config :bmx_web,
  ecto_repos: [Bmx01.Repo],
  generators: [context_app: :bmx]

config :bmx_web, BmxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "asdf",
  render_errors: [view: BmxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BmxWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [ signing_salt: "asdf" ],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: "."
  
# ----- BMX01

config :bmx01,
  ecto_repos: [Bmx01.Repo]

# ----- LOGGER

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# ----- PHOENIX/JSON

config :phoenix, :json_library, Jason

# ----- INCLUDES

import_config "#{Mix.env()}.exs"

# ----- TESTING

if Mix.env == :dev do
  config :mix_test_watch, clear: true
end


