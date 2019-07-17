defmodule Bmx01.Sys.HostTest do
  use ExUnit.Case, async: true
  alias Bmx01.Sys.Host

  test "#name" do
    name = System.get_env("SYSNAME")
    assert Host.name == name
  end
end
