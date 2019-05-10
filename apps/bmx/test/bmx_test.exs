defmodule BmxTest do
  use ExUnit.Case
  doctest Bmx

  test "greets the world" do
    assert Bmx.hello() == :world
  end
end
