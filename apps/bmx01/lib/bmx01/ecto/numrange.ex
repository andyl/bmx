defmodule Bmx01.Ecto.Numrange do
  @moduledoc """
  Demo to demonstrate the use of Ecto data types.

  See [the blog post][1] to follow the example.

  [1]: https://pedroassumpcao.ghost.io/using-postgres-range-data-type-in-ecto/
  """
  @behaviour Ecto.Type

  def type, do: :numrange

  def cast([lower, upper]) do
    {:ok, [lower, upper]}
  end

  def cast(_), do: :error

  def load(%Postgrex.Range{lower: lower, upper: nil}) do
    {lower, _} = lower |> to_float
    {:ok, [lower, nil]}
  end

  def load(%Postgrex.Range{lower: lower, upper: upper}) do
    {lower, _} = lower |> to_float
    {upper, _} = upper |> to_float
    {:ok, [lower, upper]}
  end

  def dump([lower, upper]) do
    {:ok, %Postgrex.Range{lower: lower, upper: upper, upper_inclusive: false}}
  end

  def dump(_), do: :error

  defp to_float(value) do
    value |> Decimal.to_string() |> Float.parse()
  end
end
