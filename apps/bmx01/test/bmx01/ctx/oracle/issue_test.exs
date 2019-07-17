defmodule Bmx01.Ctx.Oracle.IssueTest do
  use ExUnit.Case, async: true
  alias Bmx01.Repo
  alias Bmx01.Ctx.Oracle.Issue
  import Ecto.Query, only: [from: 2]
  import Bmx01.Factory

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end 

  test "greet the world" do
    assert "hello" == "hello"
  end

  describe "changesets" do
    test "creates a invalid changeset" do
      tmap = %Issue{}
      attr = %{title: "asdf", type: "zxcv"}
      cs = Issue.changeset(tmap, attr)
      refute cs.valid?
    end

    test "creates a valid changeset" do
      tmap = %Issue{}
      attr = %{title: "asdf", exid: "qwer", type: "zxcv"}
      cs = Issue.changeset(tmap, attr)
      assert cs.valid?
    end
  end

  describe "inserting records" do
    setup do
      {:ok, [tracker: insert(:tracker)]}
    end

    test "adds a record", ctx do
      tmap = %Issue{}
      attr = %{exid: "qwer", type: "zxcv", tracker_id: ctx[:tracker].id}
      cset = Issue.changeset(tmap, attr)
      cqry = from(t in "issues", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert {:ok, _result} = Repo.insert(cset)
      assert Repo.one(cqry) == 1
    end

    test "handling maps", ctx do 
      lmap = %{a: 1, b: 2}
      tmap = %Issue{}
      attr = %{exid: "qwer", type: "zxcv", jfields: lmap, tracker_id: ctx[:tracker].id}
      cset = Issue.changeset(tmap, attr)
      cqry = from(t in "issues", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert {:ok, trak} = Repo.insert(cset)
      assert Repo.one(cqry) == 1
      assert trak.jfields == lmap
    end
  end

  describe "using Factory" do
    test "building an entity" do
      assert build(:issue)
    end

    test "inserting an entity" do
      cqry = from(t in "issues", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert insert(:issue)
      assert Repo.one(cqry) == 1
    end

    test "uses alternate attrs" do
      cqry = from(t in "issues", select: count(t.id))
      altname = "NEWNAME"
      assert Repo.one(cqry) == 0
      assert trak = insert(:issue, %{type: altname})
      assert Repo.one(cqry) == 1
      assert trak.type == altname
    end
  end
end
