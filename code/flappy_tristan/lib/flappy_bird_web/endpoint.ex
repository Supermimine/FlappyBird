defmodule FlappyBirdWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :flappy_bird

  # La session sera stockée dans le cookie et signée,
  # cela signifie que son contenu peut être lu mais pas altéré.
  # Définissez :encryption_salt si vous souhaitez également le chiffrer.
  @session_options [
    store: :cookie,
    key: "_flappy_bird_key",
    signing_salt: "5NRkzoZ9"
  ]

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  # Servez à "/" les fichiers statiques du répertoire "priv/static".
  #
  # Vous devez définir gzip sur true si vous exécutez phx.digest
  # lors du déploiement de vos fichiers statiques en production.
  plug Plug.Static,
    at: "/",
    from: :flappy_bird,
    gzip: false,
    only: ~w(assets fonts images favicon.ico robots.txt)

  # Le rechargement du code peut être explicitement activé sous le
  # :configuration code_reloader de votre endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :flappy_bird
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug FlappyBirdWeb.Router
end
