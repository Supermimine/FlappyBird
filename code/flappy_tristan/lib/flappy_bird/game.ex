defmodule FlappyBird.Game do
  alias FlappyBird.Game
  alias FlappyBird.Scores.Score
  alias __MODULE__
  require Logger
  defstruct [:bird, :pipes, :score, :state, :updated]
  @gravity 1
  @tick 1_000_000
  @moduledoc """
  Context contenant les fonctions pour le déroulement d'une `Game`.
  """

  @doc """
  Création d'une nouvelle partie.

  ## Exemples

      iex> new()
      {:ok, %Game{}}

  ## Type d'appel
    Game.new()

  ## Valeur par défaut

      game {
        bird: %{ x: 10, y: 35, wings: 0, velocity: 0 }
        pipes: []
        score: 0.0
      }

  """
  def new() do
    %Game{
      state: :ok,
      bird: %{x: 10, y: 35, wings: 0, velocity: 0},
      pipes: [],
      score: 0.0,
      updated: System.monotonic_time() - @tick
    }
  end

  @doc """
  Mise à jour de la partie.
    Boucle d'exécution principale du jeu en exécution

    Est exécuter seulement lorsque '`state` == :ok'

  ## Description
    Il assigne 2 variables qui sont:
    - time --> qui est le temps du système actuellement
    - dt --> qui est la conversion du temps actuel en `tick` moins le dernier temps en `tick` que la partie a été `updated`.

    Par la suite, avec le `game` qu'il reçois il appel les fonctions privé suivante:
    - move_bird --> calcul les paramètres de bird (`wings`, `velocity` et `y`).
    - move_pipes --> calcul la nouvelle position des tuyaux.
    - check_for_collisions --> Compare la position du personnage(oiseau) et des obstacles(tuyaux, sol et bordure du navigateur web). Puis change le `state` selon le résultat.
    - add_pipes --> Ajout des tuyaux a une distance régulière, mais avec une hauteur aléatoire.

    Ensuite, il augmente le score de la partie de `0.1 * dt`

    Finalement, il change le `updated` de la `game` pour `time`

  ## Exemples

      iex> update(%{field: value})
      {:ok, %Game{}}

      iex> update(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  ## Type d'appel
    Game.update(game)

  ## Type de retour
    retourne `game`
  """
  def update(%{state: :ok} = game) do
    time = System.monotonic_time()
    dt = (time - game.updated) / @tick

    game
    |> move_bird
    |> move_pipes
    |> check_for_collisions
    |> add_pipes
    |> Map.put(:score, game.score + 0.1 * dt)
    |> Map.put(:updated, time)
  end

  def update(game), do: game

  @doc """
  Action de voler lorsque l'utilisateur appuis sur une touche ou clique sur l'écran de jeu.

  ## Description
    Reçois un `game`, puis modifie la variable `velocity` de son composant `bird` pour la valeur 3.

  ## Exemples

      iex> flap(%{field: value})
      {:ok, %Game{}}

      iex> flap(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  ## Type d'appel
    Game.flap(game)

  ## Type de retour
    retourne `game`

  """
  def flap(%{state: :ok} = game) do
    %{game | bird: %{game.bird | velocity: 3}}
  end

  def flap(game), do: game

  defp move_bird(game) do
    bird =
      game.bird
      |> Map.put(:wings, rem(game.bird.wings + 1, 4))
      |> Map.put(:velocity, game.bird.velocity - @gravity)
      |> Map.put(:y, min(game.bird.y - 1.5 * game.bird.velocity, 81))

    %{game | bird: bird}
  end

  defp move_pipes(game) do
    pipes =
      game.pipes
      |> Enum.map(fn p -> move_pipe(p) end)
      |> Enum.filter(fn p -> p.x > -10 end)

    %{game | pipes: pipes}
  end

  defp add_pipes(game) do
    case Enum.find(game.pipes, fn p -> p.x > 50 end) do
      nil ->
        pipes = [
          %{x: 100, y: Enum.random(-30..-5), height: 45, dir: :down},
          %{x: 100, y: Enum.random(45..80), height: 45, dir: :up}
        ]

        %{game | pipes: game.pipes ++ pipes}

      _ ->
        game
    end
  end

  defp move_pipe(pipe) do
    %{pipe | x: pipe.x - 2}
  end

  defp check_for_collisions(game) do
    game
    |> check_y_collisions
    |> check_pipe_collisions
  end

  defp check_y_collisions(game) do
    state =
      case game.bird.y do
        y when y > 80 -> :end
        y when y < 1 -> :end
        _ -> :ok
      end

    %{game | state: state}
  end

  defp check_pipe_collisions(%{state: :ok} = game) do
    state =
      case Enum.find(game.pipes, fn p ->
             game.bird.x > p.x - 2.5 && game.bird.x < p.x + 2.5 &&
               (game.bird.y > p.y and game.bird.y < p.y + p.height)
           end) do
        nil -> :ok
        _ -> :end
      end

    %{game | state: state}
  end

  defp check_pipe_collisions(game), do: game

  @doc """
  Sauvegarder le score d'une partie.

  ## Variable d'argument
    v -> value --> valeur du score à sauvegarder en string

  ## Description
    Appel la fonction `Score.changeset()` pour sauvegarder le score dans la base de données
    avec comme paramètre Entité/Structure `Score` vide --> `%Score{}` et la valeur a changer --> `%{"value" => v}`

  ## Exemples

      iex> save_score(value)
      {:ok, %Game{}}

      iex> save_score(bad_value)
      {:error, %Ecto.Changeset{}}
  """
  def save_score(v) do
    Score.changeset(%Score{}, %{"value" => v})
  end
end
