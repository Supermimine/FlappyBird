defmodule FlappyBird.Scores.Score do
  use Ecto.Schema
  import Ecto.Changeset
  @moduledoc """
  Entitée/Shema de score pour la base de donnée

  ## Shema

      schema "scores" do
        field :value, :string

        timestamps()
      end

  """

  schema "scores" do
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(score, params) do
    score
    |> cast(params, [:value])
  end
end
