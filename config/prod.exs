use Mix.Config

config :bmx_web, BmxWeb.Endpoint,
  url: [host: "localhost", port: 4050],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Application.spec(:phoenix_distillery, :vsn)

config :logger, level: :info

import_config "prod.secret.exs"
