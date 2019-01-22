defmodule GameOfLife.CellTest do
  use ExUnit.Case, async: true

  setup do
    cell = start_supervised!(GameOfLife.Cell)
    world = start_supervised!({GameOfLife.World, 3})
    %{cell: cell, world: world}
  end

  describe ".update_state/3" do
    test "calculates the next state of the cell", %{cell: cell, world: world} do
      GameOfLife.World.set(world, 0, 1, 1)
      GameOfLife.World.set(world, 1, 1, 1)
      GameOfLife.World.set(world, 2, 1, 1)

      GameOfLife.Cell.update_state(cell, world, 0, 1)
      assert GameOfLife.World.get(world, 0, 1) == 0

      GameOfLife.Cell.update_state(cell, world, 1, 0)
      assert GameOfLife.World.get(world, 1, 0) == 1
    end
  end
end
