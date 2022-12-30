defmodule FlappyBird.ScoresFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FlappyBird.Scores` context.
  """

  @doc """
  Generate a score.
  """
  def score_fixture(attrs \\ %{}) do
    {:ok, score} =
      attrs
      |> Enum.into(%{
        value: "some value"
      })
      |> FlappyBird.Scores.create_score()

    score
  end
end
