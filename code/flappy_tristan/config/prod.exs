import Config

# Pour la production, n'oubliez pas de configurer l'url host
# à quelque chose de significatif, Phoenix utilise cette information
# lors de la génération d'URL.
#
# Notez que nous incluons également le chemin vers un manifeste de cache
# contenant la version digérée des fichiers statiques. Cette
# le manifeste est généré par la tâche `mix phx.digest`,
# que vous devez exécuter après la construction des fichiers statiques et
# avant de démarrer votre serveur de production.
config :flappy_bird, FlappyBirdWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"

# Ne pas imprimer les messages de débogage en production
config :logger, level: :info

# ## Prise en charge SSL
#
# Pour que SSL fonctionne, vous devrez ajouter la clé `https`
# à la section précédente et définissez votre port `:url` sur 443 :
#
# config :flappy_bird, FlappyBirdWeb.Endpoint,
# ...,
# url : [host : "exemple.com", port : 443],
# https: [
# ...,
# port : 443,
# cipher_suite: :strong,
# fichier clé : System.get_env("SOME_APP_SSL_KEY_PATH"),
# certfile : System.get_env("SOME_APP_SSL_CERT_PATH")
# ]
#
# Le `cipher_suite` est défini sur `:strong` pour ne prendre en charge que le
# chiffrements SSL les plus récents et les plus sécurisés. Cela signifie que les anciens navigateurs
# et les clients peuvent ne pas être pris en charge. Vous pouvez le régler sur
# `:compatible` pour un support plus large.
#
# `:keyfile` et `:certfile` attendent un chemin absolu vers la clé
# et cert dans le disque ou un chemin relatif dans priv, par exemple
# "priv/ssl/server.key". Pour toutes les configurations SSL prises en charge
# options, voir https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# Nous vous recommandons également de définir `force_ssl` dans votre point de terminaison, en vous assurant
# aucune donnée n'est jamais envoyée via http, toujours redirigé vers https :
#
# config :flappy_bird, FlappyBirdWeb.Endpoint,
# force_ssl : [hsts : true]
#
# Vérifiez `Plug.SSL` pour toutes les options disponibles dans `force_ssl`.
