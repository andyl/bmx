defmodule Bmx01.Repo.Migrations.BaseMigration do
  use Ecto.Migration

  def change do
    # Tracker::BugZilla, Tracker::GitHub, Tracker::Cvrf
    # bugmark/exchange
    create table("trackers") do
      add(:type, :string)
      add(:uuid, :string)
      add(:name, :string)
      add(:jfields, :map, default: "{}")
      add(:synced_at, :utc_datetime)
      add(:exid, :string)
      timestamps()
    end

    create(index("trackers", [:type, :uuid, :exid]))

    # BugZilla, GitHub, Cve
    create table("issues") do
      add(:type, :string)
      add(:uuid, :string)
      add(:exid, :string)
      add(:sequence, :integer)
      add(:jfields, :map, default: "{}")
      add(:synced_at, :utc_datetime)
      timestamps()
    end

    create(index("issues", [:type, :uuid, :exid]))

    # BuyFixed, BuyUnfixed, SellFixed, SellUnfixed
    # BugZilla, GitHub, CVE
    # the party who made the offer
    # the ledger used to make the offer
    # optional offer prototype
    # the generating amendment
    # for SaleOffers - a Position
    # Greater than zero
    # between 0.00 and 1.00

    # for reserve pooling
    # All Or None
    # open, suspended, cancelled, ...              
    create table("offers") do
      add(:uuid, :string)
      add(:type, :string)
      add(:tracker_type, :string)
      add(:user_uuid, :string)
      add(:ledger_uuid, :string)
      add(:prototype_uuid, :string)
      add(:amendment_uuid, :string)
      add(:salable_position_uuid, :string)
      add(:volume, :integer)
      add(:price, :float)
      add(:value, :float)
      add(:poolable, :boolean, default: false)
      add(:aon, :boolean, default: false)
      add(:status, :string)
      add(:expiration, :utc_datetime)
      add(:maturation_range, :tsrange)
      add(:jfields, :map, default: "{}")
      timestamps()
    end

    create(index("offers", [:type, :uuid]))

    # optional contract prototype
    # GitHub, BugZilla, ...
    # open, matured, resolved
    # fixed, unfixed              
    create table("contracts") do
      add(:uuid, :string)
      add(:prototype_uuid, :integer)
      add(:type, :string)
      add(:status, :string)
      add(:awarded_to, :string)
      add(:maturation, :utc_datetime)
      add(:jfields, :map, default: "{}")
      timestamps()
    end

    create(index("contracts", [:type, :uuid]))

    # ----- STATEMENT FIELDS -----
    #   %i(issues offers contracts).each do |table|
    #     add_column table, :stm_issue_uuid   , :string
    #     add_column table, :stm_tracker_uuid , :string
    #     add_column table, :stm_title        , :string
    #     add_column table, :stm_body         , :string
    #     add_column table, :stm_status       , :string
    #     add_column table, :stm_labels       , :string
    #     add_column table, :stm_trader_uuid  , :string
    #     add_column table, :stm_group_uuid   , :string
    #     add_column table, :stm_currency     , :string
    #     add_column table, :stm_paypro_uuid  , :string
    #     add_column table, :stm_comments     , :jsonb  , null: false, default: {}
    #     add_column table, :stm_jfields      , :jsonb  , null: false, default: {}
    #
    #     add_index table, :stm_tracker_uuid
    #     add_index table, :stm_issue_uuid
    #     add_index table, :stm_title
    #     add_index table, :stm_body
    #     add_index table, :stm_status
    #     add_index table, :stm_labels
    #     add_index table, :stm_trader_uuid
    #     add_index table, :stm_group_uuid
    #     add_index table, :stm_comments , :using => :gin
    #     add_index table, :stm_jfields  , :using => :gin
    #   end

    # 'fixed' or 'unfixed'
    create table("positions") do
      add(:uuid, :string)
      add(:offer_uuid, :string)
      add(:user_uuid, :string)
      add(:amendment_uuid, :string)
      add(:escrow_uuid, :string)
      add(:parent_uuid, :string)
      add(:volume, :integer)
      add(:price, :float)
      add(:value, :float)
      add(:side, :string)
      timestamps()
    end

    # SORTABLE POSITION USING ACTS_AS_LIST         
    create table("escrows") do
      add(:uuid, :string)
      add(:type, :string)
      add(:sequence, :integer)
      add(:contract_uuid, :string)
      add(:amendment_uuid, :string)
      add(:fixed_value, :float, default: 0.0)
      add(:unfixed_value, :float, default: 0.0)
      timestamps()
    end

    # expand, transfer, reduce, resolve    
    # SORTABLE POSITION USING ACTS_AS_LIST 
    create table("amendments") do
      add(:uuid, :string)
      add(:type, :string)
      add(:sequence, :integer)
      add(:contract_uuid, :string)
      add(:jfields, :map, default: "{}")
      timestamps()
    end

    create table("users") do
      add(:name, :string)
      add(:email, :string)
      add(:mobile, :string)
      add(:uuid, :string)
      add(:exid, :string)
      add(:admin, :boolean)
      add(:auth_token, :string)
      add(:balance, :float, default: 0.0)
      add(:jfields, :map, default: "{}")
      add(:last_seen_at, :utc_datetime)
      timestamps()
    end

    # SORTABLE POSITION USING ACTS_AS_LIST 
    create table("user_ledgers") do
      add(:uuid, :string)
      add(:user_uuid, :string)
      add(:paypro_uuid, :string)
      add(:sequence, :integer)
      add(:name, :string)
      add(:description, :string)
      add(:currency, :string)
      add(:balance, :float, default: 0.0)
      add(:status, :string, default: "open")
      add(:jfields, :map, default: "{}")
      timestamps()
    end

    create table("user_groups") do
      add(:uuid, :string)
      add(:owner_uuid, :string)
      add(:name, :string)
      add(:description, :string)
      add(:tags, :string)
      add(:jfields, :map, default: "{}")
      add(:status, :string, default: "open")
      timestamps()
    end

    create table("user_memberships") do
      add(:uuid, :string)
      add(:user_uuid, :string)
      add(:group_uuid, :string)
      add(:status, :string, default: "active")
    end

    create table("paypros") do
      add(:uuid, :string)
      add(:name, :string)
      add(:status, :string, default: "open")
      add(:currency, :string)
      add(:pubkey, :string)
      timestamps()
    end

    # the event store...

    # inheritance column
    # uuid for the event
    # type of command that created the event
    # uuid of command that created the event
    # [event_uuid, payload].digest
    # [local_hash, chain_hash].digest              
    create table("events") do
      add(:event_type, :string)
      add(:event_uuid, :string)
      add(:cmd_type, :string)
      add(:cmd_uuid, :string)
      add(:local_hash, :string)
      add(:chain_hash, :string)
      add(:payload, :map, default: "{}")
      add(:jfields, :map, default: "{}")
      add(:user_uuids, :string, default: "[]")
      add(:tags, :string)
      add(:note, :string)
      add(:projected_at, :utc_datetime)
      timestamps()
    end

    # holds an event counter for a projection
    create table("projections") do
      add(:name, :string)
      add(:event_counter, :integer)
      timestamps()
    end
  end
end
