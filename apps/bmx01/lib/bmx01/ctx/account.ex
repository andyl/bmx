defmodule Bmx01.Ctx.Account do
  @moduledoc """
  Account context - users, balances

  API calls to query and mutate users and account balances.
  """
  alias Bmx01.Repo
  alias Bmx01.Ctx.Account.User
  import Ecto.Query, only: [from: 2]

  @doc """
  List all users
  """
  def all_users do
    Repo.all(User)
  end

  @doc """
  Get a single user, by UserID
  """
  def get_user(id) do
    Repo.get(User, id)
  end

  @doc """
  Get a users, by <params>
  """
  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  @doc """
  Create a user
  """
  def create_user(params) do
    Bmx01.Cmd.UserCmd.Create.exec(params)
  end
end
