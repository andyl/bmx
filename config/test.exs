use Mix.Config

# ----- MARCOM

config :bmx_marcom, BmxMarcom.Endpoint,
  http: [port: 4001],
  server: false

# ----- BMX_WEB

config :bmx_web, BmxWeb.Endpoint,
  http: [port: 4002],
  server: false

# ----- BMX01

config :bmx01, Bmx01.Repo,
  username: "postgres",
  password: "postgres",
  database: "bmx01_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
  
# ----- LOGGER

config :logger, level: :warn

# ----- CI

if System.get_env("TRAVIS") == "true", do: import_config "travis.exs"
