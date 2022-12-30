defmodule FlappyBird.Application do
  # Voir https://hexdocs.pm/elixir/Application.html
  # pour plus d'informations sur les applications OTP
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Démarrer le référentiel Ecto
      FlappyBird.Repo,
      # Démarrer le superviseur de télémétrie
      FlappyBirdWeb.Telemetry,
      # Démarrer le système PubSub
      {Phoenix.PubSub, name: FlappyBird.PubSub},
      # Commencer le Endpoint (http/https)
      FlappyBirdWeb.Endpoint
      # Démarrez un travailleur en appelant : FlappyBird.Worker.start_link(arg)
      # {FlappyBird.Worker, arg}
    ]

    # Voir https://hexdocs.pm/elixir/Supervisor.html
    # pour les autres stratégies et options prises en charge
    opts = [strategy: :one_for_one, name: FlappyBird.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Dites à Phoenix de mettre à jour la configuration du point de terminaison
  # chaque fois que l'application est mise à jour.
  @impl true
  def config_change(changed, _new, removed) do
    FlappyBirdWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
