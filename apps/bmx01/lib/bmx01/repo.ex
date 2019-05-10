defmodule Bmx01.Repo do
  use Ecto.Repo,
    otp_app: :bmx01,
    adapter: Ecto.Adapters.Postgres
end
