defmodule Bmx01.Sys.DataTest do
  use ExUnit.Case, async: true
  alias Bmx01.Repo
  alias Bmx01.Sys.Data
  import Ecto.Query, only: [from: 2]
  import Bmx01.Factory

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "#reset" do
    cqry = from(t in "users", select: count(t.id))
    assert Repo.one(cqry) == 0
    insert(:user)
    assert Repo.one(cqry) == 1
    Data.reset()
    assert Repo.one(cqry) == 0
  end

  test "#seed" do
    cqry = from(t in "users", select: count(t.id))
    assert Repo.one(cqry) == 0
    Data.seed()
    assert Repo.one(cqry) == 3
  end

  test "#counts" do
    assert Data.counts()[:num_users] == 0
    insert(:user)
    assert Data.counts()[:num_users] == 1
  end
end
