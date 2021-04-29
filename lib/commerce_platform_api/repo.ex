defmodule CommercePlatformApi.Repo do
  use Ecto.Repo,
    otp_app: :commerce_platform_api,
    adapter: Ecto.Adapters.Postgres
end
