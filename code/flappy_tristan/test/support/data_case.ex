defmodule FlappyBird.DataCase do
  @moduledoc """
  Ce module définit la configuration des tests nécessitant
  accès à la couche de données de l'application.

  Vous pouvez définir ici des fonctions à utiliser comme aides dans
  vos essais.

  Enfin, si le cas de test interagit avec la base de données,
  nous activons le bac à sable SQL, donc les modifications apportées à la base de données
  sont annulés à la fin de chaque test. Si vous utilisez
  PostgreSQL, vous pouvez même exécuter des tests de base de données de manière asynchrone
  en définissant `use FlappyBird.DataCase, async: true`, bien que
  cette option n'est pas recommandée pour les autres bases de données.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      alias FlappyBird.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import FlappyBird.DataCase
    end
  end

  setup tags do
    FlappyBird.DataCase.setup_sandbox(tags)
    :ok
  end

  @doc """
  Configure le bac à sable en fonction des balises de test.
  """
  def setup_sandbox(tags) do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(FlappyBird.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
  end

  @doc """
  Un assistant qui transforme les erreurs d'ensemble de modifications en une carte de messages.

      assert {:error, changeset} = Accounts.create_user(%{password: "short"})
      assert "password is too short" in errors_on(changeset).password
      assert %{password: ["password is too short"]} = errors_on(changeset)

  """
  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
