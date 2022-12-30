defmodule FlappyBirdWeb.Telemetry do
  use Supervisor
  import Telemetry.Metrics

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      # Le poller de télémétrie exécutera les mesures de période données
      # toutes les 10_000ms. En savoir plus ici: https://hexdocs.pm/telemetry_metrics
      {:telemetry_poller, measurements: periodic_measurements(), period: 10_000}
      # Ajoutez des reporters en tant qu'enfants de votre arbre de supervision.
      # {Telemetry.Metrics.ConsoleReporter, metrics: metrics()}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def metrics do
    [
      # Phoenix Métriques
      summary("phoenix.endpoint.stop.duration",
        unit: {:native, :millisecond}
      ),
      summary("phoenix.router_dispatch.stop.duration",
        tags: [:route],
        unit: {:native, :millisecond}
      ),

      # Métriques de base de données
      summary("flappy_bird.repo.query.total_time",
        unit: {:native, :millisecond},
        description: "The sum of the other measurements"
      ),
      summary("flappy_bird.repo.query.decode_time",
        unit: {:native, :millisecond},
        description: "The time spent decoding the data received from the database"
      ),
      summary("flappy_bird.repo.query.query_time",
        unit: {:native, :millisecond},
        description: "The time spent executing the query"
      ),
      summary("flappy_bird.repo.query.queue_time",
        unit: {:native, :millisecond},
        description: "The time spent waiting for a database connection"
      ),
      summary("flappy_bird.repo.query.idle_time",
        unit: {:native, :millisecond},
        description:
          "The time the connection spent waiting before being checked out for the query"
      ),

      # VM Métriques
      summary("vm.memory.total", unit: {:byte, :kilobyte}),
      summary("vm.total_run_queue_lengths.total"),
      summary("vm.total_run_queue_lengths.cpu"),
      summary("vm.total_run_queue_lengths.io")
    ]
  end

  defp periodic_measurements do
    [
      # Un module, une fonction et des arguments à invoquer périodiquement.
      # Cette fonction doit appeler :telemetry.execute/3 et une métrique doit être ajoutée ci-dessus.
      # {FlappyBirdWeb, :count_users, []}
    ]
  end
end
