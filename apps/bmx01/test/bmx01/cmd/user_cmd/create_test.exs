defmodule Bmx01.Cmd.UserCmd.CreateTest do
  use ExUnit.Case, async: true
  alias Bmx01.Repo
  alias Bmx01.Cmd.UserCmd
  import Ecto.Query, only: [from: 2]

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "#exec (valid input)" do
    test "generates a user" do
      args = %{name: "asdf", module: "(650) 555-1212"}
      cqry = from(t in "users", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert {:ok, _} = UserCmd.Create.exec(args)
      assert Repo.one(cqry) == 1
    end

    test "adds an entry to the cmd log" do
      args = %{name: "asdf", module: "(650) 555-1212"}
      cqry = from(t in "xlog_cmds", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert {:ok, _} = UserCmd.Create.exec(args)
      assert Repo.one(cqry) == 1
    end
  end

  describe "#exec (invalid input)" do
    test "returns error message" do
      args = %{}
      cqry = from(t in "users", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert {:error, _} = UserCmd.Create.exec(args)
      assert Repo.one(cqry) == 0
    end
  end
end
