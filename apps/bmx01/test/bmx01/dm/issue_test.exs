defmodule Bmx01.Dm.IssueTest do
  use ExUnit.Case, async: true
  alias Bmx01.Repo
  alias Bmx01.Dm.Issue
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
      attr = %{name: "asdf", type: "zxcv"}
      cs = Issue.changeset(tmap, attr)
      refute cs.valid?
    end

    test "creates a valid changeset" do
      tmap = %Issue{}
      attr = %{name: "asdf", exid: "qwer", type: "zxcv"}
      cs = Issue.changeset(tmap, attr)
      assert cs.valid?
    end
  end

  describe "inserting records" do
    test "adds a record" do
      tmap = %Issue{}
      attr = %{name: "asdf", exid: "qwer", type: "zxcv"}
      cset = Issue.changeset(tmap, attr)
      cqry = from(t in "issues", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert {:ok, _result} = Repo.insert(cset)
      assert Repo.one(cqry) == 1
    end

    test "handling maps" do 
      lmap = %{a: 1, b: 2}
      tmap = %Issue{}
      attr = %{name: "asdf", exid: "qwer", type: "zxcv", jfields: lmap}
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
      assert trak = insert(:issue, %{name: altname})
      assert Repo.one(cqry) == 1
      assert trak.name == altname
    end
  end
end
