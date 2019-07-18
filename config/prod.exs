use Mix.Config

# ----- MARCOM

config :bmx_marcom, BmxMarcom.Endpoint,
  url: [host: "example.com", port: 4015],
  cache_static_manifest: "priv/static/cache_manifest.json",
  check_origin: false,
  server: true

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :bmx_marcom, BmxMarcom.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [
#         :inet6,
#         port: 443,
#         cipher_suite: :strong,
#         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#         certfile: System.get_env("SOME_APP_SSL_CERT_PATH")
#       ]
#
# The `cipher_suite` is set to `:strong` to support only the
# latest and more secure SSL ciphers. This means old browsers
# and clients may not be supported. You can set it to
# `:compatible` for wider support.
#
# `:keyfile` and `:certfile` expect an absolute path to the key
# and cert in disk or a relative path inside priv, for example
# "priv/ssl/server.key". For all supported SSL configuration
# options, see https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# We also recommend setting `force_ssl` in your endpoint, ensuring
# no data is ever sent via http, always redirecting to https:
#
#     config :bmx_marcom, BmxMarcom.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :bmx_marcom, BmxMarcom.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.

# ----- BMX_WEB

config :bmx_web, BmxWeb.Endpoint,
  url: [host: "localhost", port: 4025],
  cache_static_manifest: "priv/static/cache_manifest.json",
  check_origin: false,
  server: true,
  root: ".",
  version: Application.spec(:phoenix_distillery, :vsn)

# ----- BMX01

config :bmx01, Bmx01.Repo,
  username: "postgres",
  password: "postgres",
  database: "bmx01_test",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# ----- LOGGER

config :logger, level: :info

# ----- IMPORTS

import_config "prod.secret.exs"
