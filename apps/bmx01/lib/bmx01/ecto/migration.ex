defmodule Bmx01.Ecto.Migration do
  @moduledoc """
  Adds statement fields for Bmx01 data models.

  Target models include: Issue, Offer, Contract
  """

  @doc """
  Adds statement fields to data model.

  Use in your migrations like the `timestamp()` directive:

      statements()

  """
  def statements do
    Ecto.Migration.add(:stm_title, :string)
    Ecto.Migration.add(:stm_asdf, :string)
  end

  @doc false
  defmacro __using__(_) do
    quote do
      import Bmx01.Ecto.Migration
    end
  end
end
