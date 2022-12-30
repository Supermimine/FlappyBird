defmodule FlappyBirdWeb do
  @moduledoc """
  Le point d'entrée pour définir votre interface Web, comme
  en tant que contrôleurs, vues, canaux, etc.

  Cela peut être utilisé dans votre application comme :

      utiliser FlappyBirdWeb, :controller
      utiliser FlappyBirdWeb, :view

  Les définitions ci-dessous seront exécutées pour chaque vue,
  contrôleur, etc., alors gardez-les courts et clairs, concentrés
  sur les importations, les utilisations et les pseudonymes.

  Ne définissez PAS de fonctions à l'intérieur des expressions entre guillemets
  sous. Au lieu de cela, définissez n'importe quelle fonction d'assistance dans les modules
  et importez ces modules ici.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: FlappyBirdWeb

      import Plug.Conn
      import FlappyBirdWeb.Gettext
      alias FlappyBirdWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/flappy_bird_web/templates",
        namespace: FlappyBirdWeb

      # Importer des fonctions pratiques à partir de contrôleurs
      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Inclure les importations partagées et les alias pour les vues
      unquote(view_helpers())
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {FlappyBirdWeb.LayoutView, "live.html"}

      unquote(view_helpers())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(view_helpers())
    end
  end

  def component do
    quote do
      use Phoenix.Component

      unquote(view_helpers())
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import FlappyBirdWeb.Gettext
    end
  end

  defp view_helpers do
    quote do
      # Utiliser toutes les fonctionnalités HTML (forms, tags, etc)
      use Phoenix.HTML

      # Importer les assistants LiveView et .heex (live_render, live_patch, <.form>, etc)
      import Phoenix.LiveView.Helpers

      # Importer les fonctionnalités de rendu de base (render, render_layout, etc)
      import Phoenix.View

      import FlappyBirdWeb.ErrorHelpers
      import FlappyBirdWeb.Gettext
      alias FlappyBirdWeb.Router.Helpers, as: Routes
    end
  end

  @doc """
  Lorsqu'il est utilisé, envoyez-le au controller/view/etc. approprié.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
