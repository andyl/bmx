defmodule Bmx01.Ecto.Schema do
  @moduledoc ~S"""
  Schema macros for Bmx01

  To use in your schema:

      defmodule Your.Schema do
        use Ecto.Schema
        use Bmx01.Ecto.Schema

        schema "yourtable" do
          field(:name, :string)
          statement_fields()
        end
      end

  Target schemas: Issue, Offer, Contract

  Must align with Bmx01.Ecto.Migration.statements()
  """

  @doc """
  Defined statement fields for BMX data objects.
  """
  defmacro statement_fields do
    quote do
      Ecto.Schema.__field__(__MODULE__, unquote(:stm_title), unquote(:string))
      Ecto.Schema.__field__(__MODULE__, unquote(:stm_asdf), unquote(:string))
    end
  end
end
