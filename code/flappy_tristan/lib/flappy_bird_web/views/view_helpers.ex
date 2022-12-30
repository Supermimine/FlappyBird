defmodule FlappyBirdWeb.ViewHelpers do
  alias FlappyBirdWeb.{SVGView}

  def svg(name, assigns \\ []) when is_atom(name) do
    SVGView.render("#{name}.html", assigns)
  end
end
