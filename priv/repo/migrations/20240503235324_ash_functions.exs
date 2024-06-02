defmodule App.Repo.Migrations.AshFunctions do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:orders) do
      modify :id, :uuid, default: fragment("gen_random_uuid()")
    end

    alter table(:order_items) do
      modify :id, :uuid, default: fragment("gen_random_uuid()")
    end
  end

  def down do
    alter table(:order_items) do
      modify :id, :uuid, default: fragment("uuid_generate_v4()")
    end

    alter table(:orders) do
      modify :id, :uuid, default: fragment("uuid_generate_v4()")
    end
  end
end