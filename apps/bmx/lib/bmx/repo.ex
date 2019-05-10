defmodule Bmx.Repo do
  use Ecto.Repo,
    otp_app: :bmx,
    adapter: Ecto.Adapters.Postgres
end
