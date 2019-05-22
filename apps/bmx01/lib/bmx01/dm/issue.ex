defmodule Bmx01.Dm.Issue do
  @moduledoc ~S"""
  Issue DataModel.

  Issue is associated with a Tracker.
  """
  use Ecto.Schema
  use Bmx01.Ecto.Schema
  import Ecto.Changeset

  schema "issues" do
    field(:type, :string)
    field(:uuid, :string)
    field(:name, :string)
    field(:exid, :string)
    field(:jfields, :map)
    statement_fields()
    timestamps()

    belongs_to(:tracker, Bmx01.Dm.Tracker)
  end

  def changeset(issue, attrs) do
    required_fields = [:type, :name, :exid]
    optional_fields = [:uuid, :jfields]

    issue
    |> cast(attrs, required_fields ++ optional_fields)
    |> validate_required(required_fields)
    |> assoc_constraint(:tracker)
    |> unique_constraint(:uuid)
    |> unique_constraint(:exid)
  end
end
