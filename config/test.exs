import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :kitavi, Kitavi.Repo,
  username: "kitavi_user",
  password: "YhqRd9aevo5!af",
  hostname: "localhost",
  database: "kitavi_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kitavi, KitaviWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "VuC7bfAuEe70EiOK+qRIr9d46Z5+aYyEFdnQpx8SW08ojKccX3gIGEwWt+wnxAPt",
  server: false

# In test we don't send emails.
config :kitavi, Kitavi.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
