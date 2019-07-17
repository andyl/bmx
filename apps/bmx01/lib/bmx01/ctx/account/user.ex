defmodule Bmx01.Ctx.Account.User do
  @moduledoc """
  User DataModel.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:mobile, Bmx01.Ecto.PhoneNum)
    field(:exid, :string)
    field(:jfields, :map)
    timestamps(type: :utc_datetime)
  end

  def changeset(tracker, attrs) do
    required_fields = [:name]
    optional_fields = [:email, :mobile, :jfields]

    tracker
    |> cast(attrs, required_fields ++ optional_fields)
    |> validate_required(required_fields)
    |> unique_constraint(:uuid)
    |> unique_constraint(:exid)
    |> validate_length(:mobile, is: 10)
  end
end
