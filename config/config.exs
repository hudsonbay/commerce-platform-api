# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :commerce_platform_api,
  ecto_repos: [CommercePlatformApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :commerce_platform_api, CommercePlatformApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gezCztOVJKD3K7/pRxOCsVz2/26KpvIXP6iwcLAtR6kikK55jKMTPDbjxLrheGDc",
  render_errors: [view: CommercePlatformApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CommercePlatformApi.PubSub,
  live_view: [signing_salt: "ywIHqVZp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :commerce_platform_api, CommercePlatformApi.Guardian,
  issuer: "commerce_platform_api",
  secret_key: "fOWjVRszsMcvjk/qATetcOvzT7Y6MYjlVT/lqPyiuVXvMXoZuVYSbjR9dxcZESR2FLo=",
  ttl: {3, :days}

config :commerce_platform_api, CommercePlatformApiWeb.AuthAccessPipeline,
  module: CommercePlatformApi.Guardian,
  error_handler: CommercePlatformApiWeb.AuthErrorHandler

config :waffle,
  # or Waffle.Storage.Local
  storage: Waffle.Storage.S3,
  # if using S3
  bucket: System.get_env("AWS_BUCKET_NAME")

# If using S3:
config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION")

config :commerce_platform_api, CommercePlatformApi.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ex_money,
  auto_start_exchange_rate_service: false,
  exchange_rates_retrieve_every: 300_000,
  api_module: Money.ExchangeRates.OpenExchangeRates,
  callback_module: Money.ExchangeRates.Callback,
  retriever_options: nil,
  log_failure: :warn,
  log_info: :info,
  log_success: nil,
  json_library: Jason,
  default_cldr_backend: CommercePlatformApi.Cldr

config :ex_cldr,
  json_library: Jason
