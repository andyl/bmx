defmodule Bmx01.Sys.Host do
  alias Bmx01.Ctx.Account.User
  alias Bmx01.Ctx.Oracle.{Issue, Tracker}
  alias Bmx01.Repo

  @moduledoc """
  Host information and utilities.

  Basic host-specific information and services for a Bugmarmark exchange.
  """

  @doc """
  Returns the exchange hostname.
  """
  def name do
    System.get_env("SYSNAME")
  end

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
  end

  defp reset_postgres do
    [User, Issue, Tracker] 
    |> Enum.map(&(Repo.delete_all(&1)))
  end
end
