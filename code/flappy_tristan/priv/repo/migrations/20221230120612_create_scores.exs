defmodule FlappyBird.Repo.Migrations.CreateScores do
  use Ecto.Migration

  def change do
    create table(:scores) do
      add :value, :string

      timestamps()
    end
  end
end
