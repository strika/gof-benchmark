defmodule GameOfLife.WorldTest do
  use ExUnit.Case, async: true

  setup do
    world = start_supervised!({GameOfLife.World, 3})
    %{world: world}
  end

  describe ".create/1" do
    test "creates world of given size", %{world: world} do
      assert Agent.get(world, fn state -> state end) == %{
        0 => %{ 0 => 0, 1 => 0, 2 => 0 },
        1 => %{ 0 => 0, 1 => 0, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }
    end
  end

  describe ".set/4" do
    test "sets the given state in coordinates", %{world: world} do
      GameOfLife.World.set(world, 1, 2, 1)

      assert Agent.get(world, fn state -> state end) == %{
        0 => %{ 0 => 0, 1 => 0, 2 => 0 },
        1 => %{ 0 => 0, 1 => 0, 2 => 1 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }
    end
  end
end
