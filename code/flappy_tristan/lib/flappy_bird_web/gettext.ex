defmodule FlappyBirdWeb.Gettext do
  @moduledoc """
  Un module fournissant l'internationalisation avec une API basée sur gettext.

  En utilisant [Gettext](https://hexdocs.pm/gettext),
  votre module gagne un ensemble de macros pour les traductions, par exemple :

      importer FlappyBirdWeb.Gettext

      # Traduction simplifiée
      gettext("Voici la chaîne à traduire")

      # Traduction plurielle
      ngettext("Voici la chaîne à traduire",
               "Voici les chaînes à traduire",
               3)

      # Traduction basée sur le domaine
      dgettext("errors", "Voici le message d'erreur à traduire")

  Voir le [Gettext Docs](https://hexdocs.pm/gettext) pour une utilisation détaillée.
  """
  use Gettext, otp_app: :flappy_bird
end
