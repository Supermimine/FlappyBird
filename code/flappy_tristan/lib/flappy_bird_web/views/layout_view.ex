defmodule FlappyBirdWeb.LayoutView do
  use FlappyBirdWeb, :view

  # Phoenix LiveDashboard est disponible uniquement en développement par défaut,
  # nous demandons donc à Elixir de ne pas avertir si la route du tableau de bord est manquante.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}
end
