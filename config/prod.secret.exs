use Mix.Config

secret_key_base = "asdf"

# secret_key_base =
#   System.get_env("SECRET_KEY_BASE") ||
#     raise """
#     environment variable SECRET_KEY_BASE is missing.
#     You can generate one by calling: mix phx.gen.secret
#     """

# ----- MARCOM

config :marcom, Marcom.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4040")],
  secret_key_base: secret_key_base

# secret_key_base =
#   System.get_env("SECRET_KEY_BASE") ||
#     raise """
#     environment variable SECRET_KEY_BASE is missing.
#     You can generate one by calling: mix phx.gen.secret
#     """

# ----- BMX_WEB

config :bmx_web, BmxWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4050")],
  secret_key_base: secret_key_base

# database_url =
#   System.get_env("DATABASE_URL") ||
#     raise """
#     environment variable DATABASE_URL is missing.
#     For example: ecto://USER:PASS@HOST/DATABASE
#     """

# config :bmx01, Bmx01.Repo,
#   # ssl: true,
#   url: database_url,
#   pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
