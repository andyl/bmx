defmodule Bmx01.Ctx.Oracle.Tracker do
  @moduledoc """
  Tracker DataModel.

  The Tracker references a collection of stored items of a particular type.

  Item Types could include: Bugs, Issues, Tasks, Weather, CVE, etc.

  For each Tracker, there are multiple Issues.
  """
  use Ecto.Schema
  use Bmx01.Ecto.Schema
  import Ecto.Changeset

  schema "trackers" do
    field(:type, :string)
    field(:uuid, :string)
    field(:name, :string)
    field(:exid, :string)
    field(:jfields, :map)
    timestamps(type: :utc_datetime)

    has_many(:issues, Bmx01.Ctx.Oracle.Issue)
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
