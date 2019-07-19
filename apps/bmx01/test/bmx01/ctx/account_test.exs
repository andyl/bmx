defmodule Bmx01.Ctx.AccountTest do
  use ExUnit.Case, async: true
  alias Bmx01.{Repo, Factory}
  alias Bmx01.Ctx.Account

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "#all_users" do
    test "returns a list" do
      assert Account.all_users()
    end
  end

  describe "#get_user" do
    test "gets a user created by a command" do
      assert {:ok, data} = Bmx01.Cmd.UserCmd.Create.exec(%{name: "asdf"})
      assert Account.get_user(data.id)
    end

    test "gets a user created by a factory" do
      assert data = Factory.insert(:user)
      assert Account.get_user(data.id)
    end
  end

  describe "#get_user_by" do
    test "returns record by name" do
      assert data1 = Factory.insert(:user)
      assert data2 = Account.get_user_by(name: data1.name)
      assert data1.id == data2.id
    end
  end

  describe "#num_users" do
    test "returns user count with 0 users" do
      assert Account.num_users() == 0
    end

    test "returns user count with 1 user" do
      Factory.insert(:user)
      assert Account.num_users() == 1
    end
  end

  describe "#create_user" do
    test "generates a user" do
      assert {:ok, _} = Account.create_user(%{name: "qwer"})
    end
  end
end
