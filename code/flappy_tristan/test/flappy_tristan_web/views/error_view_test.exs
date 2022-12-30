defmodule FlappyBirdWeb.ErrorViewTest do
  use FlappyBirdWeb.ConnCase, async: true

  # Apportez render/3 et render_to_string/3 pour tester les vues personnalisées
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(FlappyBirdWeb.ErrorView, "404.html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(FlappyBirdWeb.ErrorView, "500.html", []) == "Internal Server Error"
  end
end
