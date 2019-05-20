defmodule Bmx01.Dm.TrackerTest do
  use ExUnit.Case, async: true
  alias Bmx01.Repo
  alias Bmx01.Dm.Tracker
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
      tmap = %Tracker{}
      attr = %{name: "asdf", type: "zxcv"}
      cs = Tracker.changeset(tmap, attr)
      assert !cs.valid?
    end

    test "creates a valid changeset" do
      tmap = %Tracker{}
      attr = %{name: "asdf", exid: "qwer", type: "zxcv"}
      cs = Tracker.changeset(tmap, attr)
      assert cs.valid?
    end
  end

  describe "inserting records" do
    test "adds a record" do
      tmap = %Tracker{}
      attr = %{name: "asdf", exid: "qwer", type: "zxcv"}
      cset = Tracker.changeset(tmap, attr)
      cqry = from(t in "trackers", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert {:ok, _result} = Repo.insert(cset)
      assert Repo.one(cqry) == 1
    end

    test "handling maps" do 
      lmap = %{a: 1, b: 2}
      tmap = %Tracker{}
      attr = %{name: "asdf", exid: "qwer", type: "zxcv", jfields: lmap}
      cset = Tracker.changeset(tmap, attr)
      cqry = from(t in "trackers", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert {:ok, trak} = Repo.insert(cset)
      assert Repo.one(cqry) == 1
      assert trak.jfields == lmap
    end
  end



  describe "using Factory" do
    test "building an entity" do
      assert build(:tracker)
    end

    test "inserting an entity" do
      cqry = from(t in "trackers", select: count(t.id))
      assert Repo.one(cqry) == 0
      assert insert(:tracker)
      assert Repo.one(cqry) == 1
    end

    test "uses alternate attrs" do
      cqry = from(t in "trackers", select: count(t.id))
      altname = "NEWNAME"
      assert Repo.one(cqry) == 0
      assert trak = insert(:tracker, %{name: altname})
      assert Repo.one(cqry) == 1
      assert trak.name == altname
    end
  end
end
