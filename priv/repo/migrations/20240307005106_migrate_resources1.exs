defmodule App.Repo.Migrations.MigrateResources1 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create table(:orders, primary_key: false) do
      add :id, :uuid, null: false, default: fragment("uuid_generate_v4()"), primary_key: true
      add :customer_name, :text, null: false
    end

    create table(:order_items, primary_key: false) do
      add :id, :uuid, null: false, default: fragment("uuid_generate_v4()"), primary_key: true
      add :product_name, :text, null: false
      add :size_name, :text
      add :quantity, :decimal, null: false
      add :price, :decimal, null: false

      add :order_id,
          references(:orders,
            column: :id,
            name: "order_items_order_id_fkey",
            type: :uuid,
            prefix: "public"
          ),
          null: false
    end
  end

  def down do
    drop constraint(:order_items, "order_items_order_id_fkey")

    drop table(:order_items)

    drop table(:orders)
  end
end