defmodule Bmx1.Repo do
  use Ecto.Repo,
    otp_app: :bmx1,
    adapter: Ecto.Adapters.Postgres
end
