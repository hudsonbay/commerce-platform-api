defmodule CommercePlatformApi.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :description, :string
    field :name, :string
    field :sale_price, Money.Ecto.Composite.Type

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :sale_price, :description])
    |> validate_required([:name, :sale_price, :description])
  end
end
