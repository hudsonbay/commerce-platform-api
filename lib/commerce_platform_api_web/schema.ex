defmodule CommercePlatformApiWeb.Schema do
  use Absinthe.Schema

  alias CommercePlatformApiWeb.Schema

  import_types(Schema.UserTypes)
  import_types(Schema.ProductTypes)

  query do
    import_fields(:list_all_products_query)
  end

  mutation do
    import_fields(:login_mutation)
    import_fields(:create_user_mutation)
  end
end
