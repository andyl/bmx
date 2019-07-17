use Mix.Config

# ----- MARCOM

config :marcom, Marcom.Endpoint,
  http: [port: 4010],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../apps/marcom/assets", __DIR__)
    ]
  ]

config :marcom, Marcom.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/marcom/{live,views}/.*(ex)$",
      ~r"lib/marcom/templates/.*(eex)$"
    ]
  ]

# ----- BMX_WEB

config :bmx_web, BmxWeb.Endpoint,
  http: [port: 4020],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../apps/bmx_web/assets", __DIR__)
    ]
  ]

config :bmx_web, BmxWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/bmx_web/live/.*(ex)$",
      ~r"lib/bmx_web/views/.*(ex)$",
      ~r"lib/bmx_web/templates/.*(leex)$",
      ~r"lib/bmx_web/templates/.*(eex)$"
    ]
  ]

# ----- BMX01

config :bmx01, Bmx01.Repo,
  username: "postgres",
  password: "postgres",
  database: "bmx_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# ----- LOGGER

config :logger, :console, format: "[$level] $message\n"

# ----- PHOENIX

config :phoenix, :plug_init_mode, :runtime
config :phoenix, :stacktrace_depth, 20
