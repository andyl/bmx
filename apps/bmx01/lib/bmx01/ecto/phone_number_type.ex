defmodule Bmx01.Ecto.PhoneNumberType do
  @behaviour Ecto.Type
  def type, do: :string
  def cast(phone_number) when is_binary(phone_number), do: {:ok, phone_number}
  def cast(_), do: :error
  def load(phone_number) when is_binary(phone_number), do: {:ok, phone_number}
  def dump(phone_number) when is_binary(phone_number), do: {:ok, phone_number}
  def dump(_), do: :error
end
