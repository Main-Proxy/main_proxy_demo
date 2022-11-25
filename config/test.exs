import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :main_proxy_demo, MainProxyDemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "8KPlQlmGfZWrxMXsw6p1rfJyf11I6wuxaxNNAuhv8mGVqV/eVRZQIEk8c5Qf5MVx",
  server: false

# In test we don't send emails.
config :main_proxy_demo, MainProxyDemo.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
