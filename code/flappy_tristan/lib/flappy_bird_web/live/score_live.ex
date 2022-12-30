defmodule FlappyBirdWeb.ScoreLive do
  use FlappyBirdWeb, :live_view
  alias FlappyBird.Scores
  @moduledoc """
  Module de liaison entre son controller dans `flappy_bird` et sa vue portant le même nom: `score`.
  """

  @doc """
  Rendu de la page
  """
  @impl true
  def render(assigns) do
    FlappyBirdWeb.ScoreView.render("index.html", assigns)
  end

  @doc """
  Constructeur

  ## Description
  appel la fonction `Scores.subscribe` pour être appeller a chaque changement de la liste des scores.
  Avant de faire un rendu de sa vue, en retournant les `scores` -> `Scores.list_scores()`

  ## Paramètre
    - Params --> non utilisé
    - Session --> non utilisé
    - Socket

  """
  @impl true
  def mount(_params, _session, socket) do
    Scores.subscribe()
    {:ok,
      assign(socket, scores: Scores.list_scores())
    }
  end

  @impl true
  def handle_event("add", %{"score" => score}, socket) do
    Scores.create_score(score)
    {:noreply, fetch(socket)}
  end

  @impl true
  def handle_event("deleted", %{"id" => id}, socket) do
    score = Scores.get_score!(id)
    Scores.delete_score(score)
    {:noreply, fetch(socket)}
  end

  @impl true
  def handle_info({Scores, [:score | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, scores: Scores.list_scores())
  end
end
