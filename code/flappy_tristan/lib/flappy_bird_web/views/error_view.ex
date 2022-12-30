defmodule FlappyBirdWeb.ErrorView do
  use FlappyBirdWeb, :view

# Si vous souhaitez personnaliser un code de statut particulier
  # pour un certain format, vous pouvez décommenter ci-dessous.
  # def render("500.html", _assigns) do
  #   "Internal Server Error"
  # end

  # Par défaut, Phoenix renvoie le message d'état de
  # le nom du modèle. Par exemple, "404.html" devient
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
