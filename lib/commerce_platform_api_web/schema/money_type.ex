defmodule CommercePlatformApiWeb.Schema.MoneyType do
  use Absinthe.Schema.Notation

  @desc "Money type"
  object :price do
    field(:currency, :string)
    field(:amount, :decimal)
  end
end
