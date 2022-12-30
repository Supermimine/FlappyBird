defmodule FlappyBird.MixProject do
  use Mix.Project

  def project do
    [
      app: :flappy_bird,
      version: "1.0.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      name: "FlappyBird",
      description: "Version alternative de Flappy Bird",
      docs: [
        main: "FlappyBird",
        extras: ["README.md"],
        language: "fr",
        output: "../../docs"
      ]
    ]
  end

  # Configuration de l'application OTP.
  #
  # Tapez `mix help compile.app` pour plus d'informations.
  def application do
    [
      mod: {FlappyBird.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Spécifie les chemins à compiler par environnement.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Spécifie les dépendances de votre projet.
  #
  # Tapez `mix help deps` pour des exemples et des options.
  defp deps do
    [
      {:phoenix, "~> 1.6.15"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.6"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.17.5"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:esbuild, "~> 0.4", runtime: Mix.env() == :dev},
      {:swoosh, "~> 1.3"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  # Les alias sont des raccourcis ou des tâches spécifiques au projet en cours.
  # Par exemple, pour installer les dépendances du projet et effectuer d'autres tâches de configuration, exécutez :
  #
  #     $ mix setup
  #
  # Voir la documentation de `Mix` pour plus d'informations sur les alias.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"],
      "assets.deploy": ["esbuild default --minify", "phx.digest"]
    ]
  end
end
