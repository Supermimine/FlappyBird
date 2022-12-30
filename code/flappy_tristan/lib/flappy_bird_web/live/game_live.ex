defmodule FlappyBirdWeb.GameLive do
  use Phoenix.LiveView
  alias FlappyBird.Game
  require Logger
  @moduledoc """
  Module de liaison entre son controller dans `flappy_bird` et sa vue portant le même nom: `game`.
  """

  @doc """
  Rendu de la page
  """
  @impl true
  def render(assigns) do
    FlappyBirdWeb.GameView.render("index.html", assigns)
  end

  @doc """
  Constructeur

  ## Description
    appel la fonction `new_game` de `FlappyBird.Game` avant de faire un rendu de sa vue, en retournant ainsi `:ok` et `game`

  ## Paramètre
    - Params --> non utilisé
    - Session --> non utilisé
    - Socket

  """
  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(new_game(socket), projects: ["FlappyBird"])}
  end

  @impl true
  def handle_info(:tick, socket) do
    game = Game.update(socket.assigns.game)

    case game.state do
      :ok ->
        socket = schedule_tick(socket)
        {:noreply, assign(socket, game: game)}

      :end ->
        {:noreply, assign(socket, game: game)}
    end
  end

  @doc """
  Attrapeur d'événement

  ## Description
    récupère `game` dans le socket reçus, puis effectue l'action selon le nom de l'événement qui lui est associé.

  ## Nom d'événement disponible
    - keydown --> selon le `state` de `game`
      - `:ok` --> appel la fonction `Game.flap()` et assigne la valeur de retour au `game` contenue dans le socket
      - autre --> appel la fonction `new_game()`
    - save --> récupère `game` dans le socket et passe son score convertie en string à la fonction `Game.save_score()`

  ## Paramètre
    - binary --> nom de l'événement en string
    - arg2 --> non utilisé
    - Socket

  """
  @impl true
  def handle_event("keydown", _key, socket) do
    game = socket.assigns.game
    case game.state do
      :ok -> {:noreply, assign(socket, game: Game.flap(game))}
      _ -> {:noreply, new_game(socket)}
    end
  end

  def handle_event("save", _game , socket) do
    game = socket.assigns.game

    Game.save_score(Float.to_string(game.score, decimals: 2))
    {:noreply, assign(new_game(socket), projects: ["FlappyBird"])}
  end

  defp new_game(socket) do
    socket
    |> assign(game: Game.new())
    |> schedule_tick
  end

  defp schedule_tick(socket) do
    if connected?(socket) do
      Process.send_after(self(), :tick, 50)
    end

    socket
  end
end
