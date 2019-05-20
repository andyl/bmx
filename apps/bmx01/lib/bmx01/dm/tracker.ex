defmodule Bmx01.Dm.Tracker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trackers" do
    field :type, :string
    field :uuid, :string
    field :name, :string
    field :exid, :string
    field :jfields, :map
    timestamps()
  end

  def changeset(tracker, attrs) do
    required_fields = [:type, :name, :exid]
    optional_fields = [:uuid, :jfields]

    tracker
    |> cast(attrs, required_fields ++ optional_fields)
    |> validate_required(required_fields)
    |> unique_constraint(:uuid)
    |> unique_constraint(:exid)
  end
end
