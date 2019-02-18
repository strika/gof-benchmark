defmodule GameOfLifeTest do
  use ExUnit.Case, async: true

  setup do
    world = start_supervised!({GameOfLife.World, 3})

    GameOfLife.World.set(world, 0, 1, 1)
    GameOfLife.World.set(world, 1, 1, 1)
    GameOfLife.World.set(world, 2, 1, 1)

    %{world: world}
  end

  describe ".update_world_sequentially/1" do
    test "calculates the next state of the world", %{world: world} do
      GameOfLife.update_world_sequentially(world)

      assert GameOfLife.World.state(world) == %{
        0 => %{ 0 => 0, 1 => 0, 2 => 0 },
        1 => %{ 0 => 1, 1 => 1, 2 => 1 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }
    end
  end

  describe ".update_world_with_spawn/1" do
    test "calculates the next state of the world", %{world: world} do
      GameOfLife.update_world_with_spawn(world)

      assert GameOfLife.World.state(world) == %{
        0 => %{ 0 => 0, 1 => 0, 2 => 0 },
        1 => %{ 0 => 1, 1 => 1, 2 => 1 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }
    end
  end

  describe ".update_world_with_column_spawn/1" do
    test "calculates the next state of the world", %{world: world} do
      GameOfLife.update_world_with_column_spawn(world)

      assert GameOfLife.World.state(world) == %{
        0 => %{ 0 => 0, 1 => 0, 2 => 0 },
        1 => %{ 0 => 1, 1 => 1, 2 => 1 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }
    end
  end

  describe ".update_cell/4" do
    test "calculates the next state of the cell", %{world: world}  do
      current_state = GameOfLife.World.state(world)

      GameOfLife.update_cell(world, current_state, 0, 1)
      GameOfLife.update_cell(world, current_state, 1, 0)

      new_state = GameOfLife.World.state(world)

      assert GameOfLife.Cell.state(new_state, 0, 1) == 0
      assert GameOfLife.Cell.state(new_state, 1, 0) == 1
    end
  end
end
