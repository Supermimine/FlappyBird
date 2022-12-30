defmodule FlappyBirdWeb.ErrorHelpers do
  @moduledoc """
  Commodités pour traduire et créer des messages d'erreur.
  """

  use Phoenix.HTML

  @doc """
  Génère une balise pour les erreurs de saisie de formulaire en ligne.
  """
  def error_tag(form, field) do
    Enum.map(Keyword.get_values(form.errors, field), fn error ->
      content_tag(:span, translate_error(error),
        class: "invalid-feedback",
        phx_feedback_for: input_name(form, field)
      )
    end)
  end

  @doc """
  Traduit un message d'erreur à l'aide de gettext.
  """
  def translate_error({msg, opts}) do
    # Lors de l'utilisation de gettext, nous passons généralement les chaînes que nous voulons
    # à traduire en argument statique :
    #
    # # Traduire "is invalid" dans le domaine "errors"
    # dgettext("erreurs", "n'est pas valide")
    #
    # # Traduire le nombre de fichiers avec des règles plurielles
    # dngettext("errors", "1 file", "%{count} files", count)
    #
    # Parce que les messages d'erreur que nous affichons dans nos formulaires et API
    # sont définis dans Ecto, nous devons les traduire dynamiquement.
    # Cela nous oblige à appeler le module Gettext en passant notre gettext
    # backend comme premier argument.
    #
    # Notez que nous utilisons le domaine "errors", ce qui signifie des traductions
    # doit être écrit dans le fichier errors.po. L'option :count est
    # défini par Ecto et indique que nous devrions également appliquer des règles plurielles.
    if count = opts[:count] do
      Gettext.dngettext(FlappyBirdWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(FlappyBirdWeb.Gettext, "errors", msg, opts)
    end
  end
end
