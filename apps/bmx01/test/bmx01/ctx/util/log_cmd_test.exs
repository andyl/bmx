defmodule Bmx01.Ctx.Util.LogCmdTest do 
  use ExUnit.Case, async: true
  alias Bmx01.Repo
  alias Bmx01.Ctx.Util.LogCmd
  import Ecto.Query, only: [from: 2]

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "greet the world" do
    assert "hello" == "hello"
  end

  describe "inserting records" do
    test "adds a record" do
      tmap = %LogCmd{}
      attr = %{cmd_type: "asdf"}
      cset = LogCmd.changeset(tmap, attr)
      cqry = from(t in "xlog_cmds", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert {:ok, _result} = Repo.insert(cset)
      assert Repo.one(cqry) == 1
    end
  end
end
