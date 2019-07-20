defmodule Bmx01.Sys.Data do
  alias Bmx01.Ctx.Account.User
  alias Bmx01.Ctx.Oracle.{Issue, Tracker}
  alias Bmx01.Ctx.Util.LogCmd
  alias Bmx01.Cmd.UserCmd
  alias Bmx01.Repo
  import Ecto.Query, only: [from: 2]

  @moduledoc """
  Host data utilities.

  Services for managing host-data.  Mostly intended to be used for testing and
  simulations.
  """

  @doc """
  Reset the exchange to a clean state.

  Removes all data records.  Resets clock to current host-time.
  """
  def reset do
    reset_postgres()
  end

  @doc """
  Create seed data for an exchange.  

  Useful for prototyping and research.
  """
  def seed do
    UserCmd.Create.exec(%{name: "user1"}) 
    UserCmd.Create.exec(%{name: "user2"})
    UserCmd.Create.exec(%{name: "user3"})
  end

  @doc """
  Return counts of data elements.
  """
  def counts do
    usr_qry = from(t in "users", select: count(t.id))

    %{
      num_users: Repo.one(usr_qry)
    }
  end

  defp reset_postgres do
    [User, Issue, Tracker, LogCmd] 
    |> Enum.map(&Repo.delete_all(&1))
  end
end
