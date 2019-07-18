defmodule Bmx01.Sys.Host do
  alias Bmx01.Ctx.Account.User
  alias Bmx01.Ctx.Oracle.{Issue, Tracker}
  alias Bmx01.Repo

  @moduledoc """
  Host information and utilities.

  Basic host-specific information for a Bugmarmark exchange.
  """

  @doc """
  Returns the exchange hostname.
  """
  def name do
    System.get_env("SYSNAME")
  end
end
