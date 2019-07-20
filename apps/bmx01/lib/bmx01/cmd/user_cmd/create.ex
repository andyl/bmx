defmodule Bmx01.Cmd.UserCmd.Create do
  alias Bmx01.Ctx.Account.User
  alias Bmx01.Ctx.Util.LogCmd
  alias Bmx01.Repo

  @moduledoc """
  Command: User Create - creates a new exchange user
  """

  @doc """
  Execute the UserCreate command.

  TBD TBD TBD TBD TBD
  """
  def exec(args) do
    args
    |> validate()
    |> project()
  end

  defp validate(args) do
    cs = User.changeset(%User{}, args)

    if cs.valid? do
      LogCmd.insert("UserCmd.Create", [])
      {:ok, cs}
    else
      {:error, cs}
    end
  end

  defp project({:ok, changeset}) do
    Repo.insert(changeset)
  end

  defp project({:error, changeset}) do
    {:error, changeset}
  end
end
