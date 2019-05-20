defmodule Bmx01.Ecto.PhoneNumType do
  @moduledoc """
  This is a demo - created to demonstrate the use of Ecto data types.

  See [the tutorial video](https://www.youtube.com/watch?v=MQNmXNyc_Bs) 
  to follow the example.
  """
  @behaviour Ecto.Type

  def type, do: :string
  def cast(phone_number) when is_binary(phone_number), do: {:ok, phone_number}
  def cast(_), do: :error
  def load(phone_number) when is_binary(phone_number), do: {:ok, phone_number}
  def dump(phone_number) when is_binary(phone_number), do: {:ok, phone_number}
  def dump(_), do: :error
end
