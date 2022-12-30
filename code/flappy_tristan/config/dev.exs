import Config

# Configurez votre base de données
config :flappy_bird, FlappyBird.Repo,
  username: "postgres",
  password: "Qwerty123!",
  hostname: "localhost",
  database: "flappy_bird_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Pour le développement, nous désactivons tout cache et activons
# débogage et rechargement de code.
#
# La configuration des observateurs peut être utilisée pour exécuter des
# observateurs à votre application. Par exemple, nous l'utilisons
# avec esbuild pour regrouper les sources .js et .css.
config :flappy_bird, FlappyBirdWeb.Endpoint,
# La liaison à l'adresse IPv4 de bouclage empêche l'accès depuis d'autres machines.
  # Remplacez par `ip : {0, 0, 0, 0}` pour autoriser l'accès depuis d'autres machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "G4RDZOeHpRKEDX3CD92PaoyIMTyMVBIxI3Vq/UcZ6iWHtKY8kq+jhBpcrmx8wSf/",
  watchers: [
    # Démarrez l'observateur esbuild en appelant Esbuild.install_and_run(:default, args)
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ]

# ## Prise en charge SSL
#
# Afin d'utiliser HTTPS dans le développement, un auto-signé
# certificat peut être généré en exécutant ce qui suit
# Tâche de mélange :
#
# mélanger phx.gen.cert
#
# Notez que cette tâche nécessite Erlang/OTP 20 ou une version ultérieure.
# Exécutez `mix help phx.gen.cert` pour plus d'informations.
#
# La configuration `http:` ci-dessus peut être remplacée par :
#
# https: [
# port : 4001,
# cipher_suite: :strong,
# fichier clé : "priv/cert/selfsigned_key.pem",
# certfile : "priv/cert/selfsigned.pem"
# ],
#
# Si vous le souhaitez, les touches `http:` et `https:` peuvent être
# configuré pour exécuter les serveurs http et https sur
# ports différents.

# Regardez les statiques et les modèles pour le rechargement du navigateur.
config :flappy_bird, FlappyBirdWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/flappy_bird_web/(live|views)/.*(ex)$",
      ~r"lib/flappy_bird_web/templates/.*(eex)$"
    ]
  ]

# N'incluez pas les métadonnées ni les horodatages dans les journaux de développement
config :logger, :console, format: "[$level] $message\n"

# Définissez un stacktrace plus élevé pendant le développement. Évitez de configurer de tels
# en production car la construction de grandes stacktraces peut être coûteuse.
config :phoenix, :stacktrace_depth, 20

# Initialiser les plugs au moment de l'exécution pour une compilation de développement plus rapide
config :phoenix, :plug_init_mode, :runtime
