defmodule FlappyBird.Scores do
  require Logger
  @moduledoc """
  Contexte de la gestion des scores.
  """

  import Ecto.Query, warn: false
  alias FlappyBird.Repo

  alias FlappyBird.Scores.Score

  @topic inspect(__MODULE__)

  def subscribe do
    Phoenix.PubSub.subscribe(FlappyBird.PubSub, @topic)
  end

  defp broadcast_change({:ok, result}, event) do
    Phoenix.PubSub.broadcast(FlappyBird.PubSub, @topic, {__MODULE__, event, result})
  end


  @doc """
  Retourne la liste des scores.

  ## Exemples

      iex> list_scores()
      [%Score{}, ...]

  """
  def list_scores do
    Repo.all(Score)
  end

  @doc """
  Obtenir un seul score.

  Lève `Ecto.NoResultsError` si le Score n'existe pas.

  ## Exemples

      iex> get_score!(123)
      %Todo{}

      iex> get_score!(456)
      ** (Ecto.NoResultsError)

  """
  def get_score!(id), do: Repo.get!(Score, id)

  @doc """
  Créer un score.

  ## Exemples

      iex> create_score(%{field: value})
      {:ok, %Score{}}

      iex> create_score(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_score(attrs \\ %{}) do
    %Score{}
    |> Score.changeset(attrs)
    |> Repo.insert()
    |> broadcast_change([:score, :created])
  end

  @doc """
  Modifier un score.

  ## Exemples

      iex> update_score(score, %{field: new_value})
      {:ok, %Score{}}

      iex> update_score(score, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_score(%Score{} = score, attrs) do
    score
    |> Score.changeset(attrs)
    |> Repo.update()
    |> broadcast_change([:score, :updated])
  end

  @doc """
  Supprimer un score.

  ## Exemples

      iex> delete_score(score)
      {:ok, %Score{}}

      iex> delete_score(score)
      {:error, %Ecto.Changeset{}}

  """
  def delete_score(%Score{} = score) do
    score
      |> Repo.delete()
      |> broadcast_change([:score, :deleted])
  end

  @doc """
  Renvoie un `%Ecto.Changeset{}` pour le suivi des changements d'un score.

  ## Exemples

      iex> change_score(score)
      %Ecto.Changeset{data: %Score{}}

  """
  def change_score(%Score{} = score, attrs \\ %{}) do
    Score.changeset(score, attrs)
  end
end
