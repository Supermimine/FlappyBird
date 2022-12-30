import Config

# Configurez votre base de données
#
# La variable d'environnement MIX_TEST_PARTITION peut être utilisée
# pour fournir un partitionnement de test intégré dans l'environnement CI.
# Exécutez `mix help test` pour plus d'informations.
config :flappy_bird, FlappyBird.Repo,
  username: "postgres",
  password: "Qwerty123!",
  hostname: "localhost",
  database: "flappy_bird_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# Nous n'exécutons pas de serveur pendant le test. S'il en faut un,
# vous pouvez activer l'option de serveur ci-dessous.
config :flappy_bird, FlappyBirdWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wdUz1f/LRSPdf/EKMZxgVECz+IT//0ncTPqMoKRrfTPBMbJzeTh1Z2H7eMEiiFnh",
  server: false

# En test, nous n'envoyons pas d'e-mails.
config :flappy_bird, FlappyBird.Mailer, adapter: Swoosh.Adapters.Test

# Imprimer uniquement les avertissements et les erreurs pendant le test
config :logger, level: :warn

# Initialiser les plugs au moment de l'exécution pour une compilation plus rapide des tests
config :phoenix, :plug_init_mode, :runtime
