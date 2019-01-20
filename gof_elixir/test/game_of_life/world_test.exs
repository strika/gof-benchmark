defmodule GameOfLife.WorldTest do
  use ExUnit.Case, async: true

  describe "World.create/1" do
    test "creates world of given size" do
      world = GameOfLife.World.create(3)

      assert world == %{
        0 => %{ 0 => 0, 1 => 0, 2 => 0 },
        1 => %{ 0 => 0, 1 => 0, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }
    end
  end

  describe "World.set/4" do
    test "sets the given state in coordinates" do
      world = GameOfLife.World.create(3)

      assert GameOfLife.World.set(world, 1, 2, 1) == %{
        0 => %{ 0 => 0, 1 => 0, 2 => 0 },
        1 => %{ 0 => 0, 1 => 0, 2 => 1 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }
    end
  end

  describe "World.get/3" do
    test "gets cell state" do
      world = %{
        0 => %{ 0 => 0, 1 => 0, 2 => 0 },
        1 => %{ 0 => 0, 1 => 1, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.World.get(world, 1, 1) == 1
    end
  end

  describe "World.alive_in_neighborhood/3" do
    setup do
      %{
        0 => %{ 0 => 1, 1 => 1, 2 => 0 },
        1 => %{ 0 => 1, 1 => 1, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 1 },
      }
    end

    test "returns number of alive cells in neighborhood", world do
      assert GameOfLife.World.alive_in_neighborhood(world, 0, 0) == 3
      assert GameOfLife.World.alive_in_neighborhood(world, 0, 1) == 3
      assert GameOfLife.World.alive_in_neighborhood(world, 1, 1) == 4
      assert GameOfLife.World.alive_in_neighborhood(world, 2, 2) == 1
    end
  end
end
