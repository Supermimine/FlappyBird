import Config

# config/runtime.exs est exécuté pour tous les environnements, y compris
# lors des sorties. Il est exécuté après la compilation et avant le
# le système démarre, il est donc généralement utilisé pour charger la configuration de production
# et les secrets des variables d'environnement ou d'ailleurs. Ne pas définir
# toute configuration au moment de la compilation ici, car elle ne sera pas appliquée.
# Le bloc ci-dessous contient la configuration d'exécution spécifique à la production.

# ## Utilisation des versions
#
# Si vous utilisez `mix release`, vous devez explicitement activer le serveur
# en passant le PHX_SERVER=true au démarrage :
#
# PHX_SERVER=true bin/flappy_bird start
#
# Alternativement, vous pouvez utiliser `mix phx.gen.release` pour générer un `bin/server`
# script qui définit automatiquement la variable d'environnement ci-dessus.
if System.get_env("PHX_SERVER") do
  config :flappy_bird, FlappyBirdWeb.Endpoint, server: true
end

if config_env() == :prod do
  database_url =
    System.get_env("DATABASE_URL") ||
      raise """
      environment variable DATABASE_URL is missing.
      For example: ecto://USER:PASS@HOST/DATABASE
      """

  maybe_ipv6 = if System.get_env("ECTO_IPV6"), do: [:inet6], else: []

  config :flappy_bird, FlappyBird.Repo,
    # ssl: true,
    url: database_url,
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
    socket_options: maybe_ipv6

  # La base de clés secrètes est utilisée pour signer/chiffrer les cookies et autres secrets.
  # Une valeur par défaut est utilisée dans config/dev.exs et config/test.exs mais vous
  # voulez utiliser une valeur différente pour prod et vous ne voulez probablement pas
  # pour vérifier cette valeur dans le contrôle de version, nous utilisons donc un environnement
  # variable à la place.
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  host = System.get_env("PHX_HOST") || "example.com"
  port = String.to_integer(System.get_env("PORT") || "4000")

  config :flappy_bird, FlappyBirdWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      # Activer IPv6 et lier sur toutes les interfaces.
      # Réglez-le sur {0, 0, 0, 0, 0, 0, 0, 1} pour un accès au réseau local uniquement.
      # Voir la documentation sur https://hexdocs.pm/plug_cowboy/Plug.Cowboy.html
      # pour plus de détails sur l'utilisation d'IPv6 par rapport à IPv4 et le bouclage par rapport aux adresses publiques.
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: port
    ],
    secret_key_base: secret_key_base

# ## Configuration du mailer
  #
  # En production, vous devez configurer le mailer pour utiliser un adaptateur différent.
  # De plus, vous devrez peut-être configurer le client API Swoosh de votre choix si vous
  # n'utilisent pas SMTP. Voici un exemple de configuration :
  #
  # config :flappy_bird, FlappyBird.Mailer,
  # adaptateur : Swoosh.Adapters.Mailgun,
  # api_key : System.get_env("MAILGUN_API_KEY"),
  # domaine : System.get_env("MAILGUN_DOMAIN")
  #
  # Pour cet exemple, vous devez inclure un client HTTP requis par le client API Swoosh.
  # Swoosh prend en charge Hackney et Finch prêts à l'emploi :
  #
  # config :swoosh, :api_client, Swoosh.ApiClient.Hackney
  #
  # Voir https://hexdocs.pm/swoosh/Swoosh.html#module-installation pour plus de détails.
end
