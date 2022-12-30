defmodule FlappyBirdWeb.ConnCase do
  @moduledoc """
  Ce module définit le cas de test à utiliser par
  tests nécessitant l'établissement d'une connexion.

  Ces tests reposent sur `Phoenix.ConnTest` et également
  importer d'autres fonctionnalités pour le rendre plus facile
  pour construire des structures de données communes et interroger la couche de données.

  Enfin, si le cas de test interagit avec la base de données,
  nous activons le bac à sable SQL, donc les modifications apportées à la base de données
  sont annulés à la fin de chaque test. Si vous utilisez
  PostgreSQL, vous pouvez même exécuter des tests de base de données de manière asynchrone
  en définissant `use FlappyBirdWeb.ConnCase, async: true`, bien que
  cette option n'est pas recommandée pour les autres bases de données.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Commodités d'importation pour les tests avec des connexions
      import Plug.Conn
      import Phoenix.ConnTest
      import FlappyBirdWeb.ConnCase

      alias FlappyBirdWeb.Router.Helpers, as: Routes

      # Le point de terminaison par défaut pour les tests
      @endpoint FlappyBirdWeb.Endpoint
    end
  end

  setup tags do
    FlappyBird.DataCase.setup_sandbox(tags)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
