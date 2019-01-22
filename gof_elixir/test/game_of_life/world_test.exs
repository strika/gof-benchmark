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

  describe ".get/3" do
    test "gets cell state", %{world: world} do
      assert GameOfLife.World.get(world, 1, 1) == 0
    end
  end

  describe ".alive?/3" do
    test "gets cell state", %{world: world} do
      assert !GameOfLife.World.alive?(world, 0, 0)
    end
  end

  describe ".alive_in_neighborhood/3" do
    test "returns number of alive cells in neighborhood", %{world: world} do
      GameOfLife.World.set(world, 0, 0, 1)
      GameOfLife.World.set(world, 0, 1, 1)
      GameOfLife.World.set(world, 1, 0, 1)
      GameOfLife.World.set(world, 1, 1, 1)
      GameOfLife.World.set(world, 2, 2, 1)

      assert GameOfLife.World.alive_in_neighborhood(world, 0, 0) == 3
      assert GameOfLife.World.alive_in_neighborhood(world, 0, 1) == 3
      assert GameOfLife.World.alive_in_neighborhood(world, 1, 1) == 4
      assert GameOfLife.World.alive_in_neighborhood(world, 2, 2) == 1
    end
  end
end
