defmodule FlappyBird.Repo do
  use Ecto.Repo,
    otp_app: :flappy_bird,
    adapter: Ecto.Adapters.Postgres
end
