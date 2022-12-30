defmodule FlappyBirdWeb.PageController do
  use FlappyBirdWeb, :controller


  @doc """
  Indexion et rendu de la page "index.html"

  """
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
