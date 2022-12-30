# Ce fichier est responsable de la configuration de votre application
# et ses dépendances à l'aide du module Config.
#
# Ce fichier de configuration est chargé avant toute dépendance et
# est limité à ce projet.

# Configuration générale de l'application
import Config

config :flappy_bird,
  ecto_repos: [FlappyBird.Repo]

# Configure le `endpoint`
config :flappy_bird, FlappyBirdWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: FlappyBirdWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FlappyBird.PubSub,
  live_view: [signing_salt: "y6HMnB5U"]

# Configure le `mailer`
#
# Par défaut, il utilise le "Local" adaptateur qui stocke les emails
# localement. Vous pouvez voir les e-mails dans votre navigateur, à "/dev/mailbox".
#
# Pour la production, il est recommandé de configurer un adaptateur différent
# au `config/runtime.exs`.
config :flappy_bird, FlappyBird.Mailer, adapter: Swoosh.Adapters.Local

# Le client API Swoosh est nécessaire pour les adaptateurs autres que SMTP.
config :swoosh, :api_client, false

# Configurer esbuild (la version est obligatoire)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure l'enregistreur d'Elixir
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Utilisez Jason pour l'analyse JSON à Phoenix
config :phoenix, :json_library, Jason

# Importer la configuration spécifique à l'environnement. Cela doit rester au fond
# de ce fichier afin qu'il remplace la configuration définie ci-dessus.
import_config "#{config_env()}.exs"
