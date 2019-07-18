defmodule Bmx01.Ctx.Util.LogCmd do
  @moduledoc """
  Command Log
  """
  use Ecto.Schema
  alias Bmx01.Ctx.Util.LogCmd
  alias Bmx01.Repo
  import Ecto.Changeset

  schema "xlog_cmds" do
    field(:cmd_type, :string)
    field(:cmd_uuid, :string)
    field(:local_hash, :string)
    field(:chain_hash, :string)
    timestamps(type: :utc_datetime)
  end

  def changeset(tracker, attrs) do
    required_fields = [:cmd_type]
    optional_fields = [:cmd_uuid]

    tracker
    |> cast(attrs, required_fields ++ optional_fields)
    |> validate_required(required_fields)
    |> unique_constraint(:cmd_uuid)
  end

  def insert(cmd_type, _payload) do
    changeset(%LogCmd{}, %{cmd_type: cmd_type})
    |> Repo.insert()
  end
end
