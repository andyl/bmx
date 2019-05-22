defmodule Bmx01.Ecto.Migration do
  @moduledoc """
  Adds statement fields for Bmx01 data models.

  To use in your migration:

      defmodule Your.Migration do
        use Ecto.Migration
        use Bmx01.Ecto.Migration

        def change do
          create table("mytable") do
            add(:name, :string)
            statements()
            timestamps()
          end
        end
       end

  Target models include: Issue, Offer, Contract

  Must align with Bmx01.Ecto.Schema.statement_fields()
  """

  @doc """
  Adds `statement` fields to data model.

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
