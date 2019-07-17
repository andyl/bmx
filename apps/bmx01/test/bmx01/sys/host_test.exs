defmodule Bmx01.Sys.HostTest do
  use ExUnit.Case, async: true
  alias Bmx01.Repo
  alias Bmx01.Sys.Host
  import Ecto.Query, only: [from: 2]
  import Bmx01.Factory

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "#name" do
    name = System.get_env("SYSNAME")
    assert Host.name() == name
  end

  test "#reset" do
    cqry = from(t in "users", select: count(t.id))
    assert Repo.one(cqry) == 0
    insert(:user)
    assert Repo.one(cqry) == 1
    Host.reset()
    assert Repo.one(cqry) == 0
  end
end
