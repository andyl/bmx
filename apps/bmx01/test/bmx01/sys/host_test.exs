defmodule Bmx01.Sys.HostTest do
  use ExUnit.Case, async: true
  alias Bmx01.Repo
  alias Bmx01.Sys.Host

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "#name" do
    name = System.get_env("SYSNAME")
    assert Host.name() == name
  end
end
