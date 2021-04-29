defmodule CommercePlatformApiWeb.Resolvers.Products do
  alias CommercePlatformApi.Products

  def list_products(_, _, _) do
    {:ok, Products.list_products()}
  end
end
