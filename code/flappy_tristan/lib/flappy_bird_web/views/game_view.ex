defmodule FlappyBirdWeb.GameView do
  use FlappyBirdWeb, :view
  @moduledoc """
  FlappyBirdWeb.GameView retourne la vue s'appellant 'Game'
  """

  @doc """
  Convertie un score(double) pour une valeur float

  ## Exemples
    iex> format_score(value)
    {:ok, %Score{}}

  ## Type d'utilisation
    format_score(score)

  ## Type de retour
    retourne score
  """
  def format_score(score) do
    score |> Float.round(1)
  end
end
