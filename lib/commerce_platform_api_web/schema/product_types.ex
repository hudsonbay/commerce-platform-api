defmodule CommercePlatformApiWeb.Schema.ProductTypes do
  use Absinthe.Schema.Notation

  import_types Absinthe.Type.Custom
  import_types CommercePlatformApiWeb.Schema.MoneyType

  alias CommercePlatformApiWeb.Resolvers

  @desc "A product"
  object :product do
    field :name, :string
    field :description, :string
    field :sale_price, :price
  end

  # object :create_product_mutation do
  #   @desc """
  #   create product
  #   """

  #   @desc "Create a product"
  #   field :create_product, :product do
  #     arg(:name, non_null(:string))
  #     arg(:description, non_null(:string))
  #     arg(:sale_price, non_null(:price))

  #     resolve(&Resolvers.Products.create_product/3)
  #   end
  # end

  object :list_all_products_query do
    @desc """
    list all products
    """

    @desc "List all products"
    field :products, list_of(:product) do
      resolve(&Resolvers.Products.list_products/3)
    end
  end
end
