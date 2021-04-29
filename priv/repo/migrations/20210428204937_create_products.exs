defmodule CommercePlatformApi.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :sale_price, :money_with_currency
      add :description, :text

      timestamps()
    end
  end
end
