defmodule Bmx01.Ctx.AccountTest do 
  use ExUnit.Case, async: true
  alias Bmx01.Repo
  alias Bmx01.Ctx.Account

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "#users" do
    test "returns a list" do
      assert Account.users()
    end
  end

  # describe "inserting records" do
  #   test "adds a record" do
  #     tmap = %LogCmd{}
  #     attr = %{cmd_type: "asdf"}
  #     cset = LogCmd.changeset(tmap, attr)
  #     cqry = from(t in "xlog_cmds", select: count(t.id))
  #     assert Repo.one(cqry) == 0
  #     assert {:ok, _result} = Repo.insert(cset)
  #     assert Repo.one(cqry) == 1
  #   end
  # end
end
