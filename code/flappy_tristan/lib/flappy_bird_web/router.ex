defmodule FlappyBirdWeb.Router do
  use FlappyBirdWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {FlappyBirdWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FlappyBirdWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/game", GameLive
    live "/score", ScoreLive
  end

  # D'autres étendues peuvent utiliser des piles personnalisées.
  # scope "/api", FlappyBirdWeb do
  #   pipe_through :api
  # end

  # Active LiveDashboard uniquement pour le développement
  #
  # Si vous souhaitez utiliser le LiveDashboard en production, vous devez mettre
  # derrière l'authentification et n'autoriser que les administrateurs à y accéder.
  # Si votre application n'a pas encore de section réservée aux administrateurs,
  # vous pouvez utiliser Plug.BasicAuth pour configurer une authentification de base
  # tant que vous utilisez également SSL (ce que vous devriez de toute façon).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: FlappyBirdWeb.Telemetry
    end
  end

# Active l'aperçu de la boîte aux lettres Swoosh en développement.
  #
  # Notez que l'aperçu n'affiche que les e-mails qui ont été envoyés par le même
  # nœud exécutant le serveur Phoenix.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
