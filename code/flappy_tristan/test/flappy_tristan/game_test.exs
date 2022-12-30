defmodule FlappyBird.GameTest do
  use ExUnit.Case
  alias FlappyBird.Game

  describe "new/0" do
    test "returns a new game" do
      tick = 1_000_000
      assert Game.new() == %Game{state: :ok, bird: %{x: 10, y: 35, wings: 0, velocity: 0}, pipes: [], score: 0.0, updated: System.monotonic_time() - tick}
    end
  end
end
