defmodule Bmx01.Ecto.PhoneNum do
  import String, only: [slice: 3]

  @moduledoc """
  Demo to demonstrate the use of Ecto data types.

  See [the tutorial video](https://www.youtube.com/watch?v=MQNmXNyc_Bs) 
  to follow the example.
  """
  @behaviour Ecto.Type

  def type, do: :string

  def cast(phone_num) when is_binary(phone_num), do: cast_num(phone_num)
  def cast(_), do: :error

  def load(phone_num) when is_binary(phone_num), do: {:ok, present(phone_num)}

  def dump(phone_num) when is_binary(phone_num), do: {:ok, phone_num}
  def dump(_), do: :error

  defp cast_num(phone_num) do
    case sanitize_num(phone_num) do
      "" -> :error
      pn -> {:ok, pn}
    end
  end

  defp sanitize_num(phone_num) do
    Regex.scan(~r/\d+/, phone_num)
    |> List.flatten()
    |> List.to_string()
  end

  defp present(phone_num) do
    with code <- slice(phone_num, 0, 3),
         pref <- slice(phone_num, 3, 3),
         sufx <- slice(phone_num, 6, 4) do
      "(#{code}) #{pref}-#{sufx}"
    end
  end
end
