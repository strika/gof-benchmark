defmodule GameOfLife.CellTest do
  use ExUnit.Case, async: true

  setup do
    world = %{
      0 => %{ 0 => 0, 1 => 1, 2 => 0 },
      1 => %{ 0 => 0, 1 => 1, 2 => 0 },
      2 => %{ 0 => 0, 1 => 1, 2 => 0 }
    }
    %{world: world}
  end

  describe ".state/3" do
    test "gets cell state", %{world: world} do
      assert GameOfLife.Cell.state(world, 0, 0) == 0
      assert GameOfLife.Cell.state(world, 0, 1) == 1
      assert GameOfLife.Cell.state(world, 1, 0) == 0
      assert GameOfLife.Cell.state(world, 1, 1) == 1
    end
  end

  describe ".alive?/3" do
    test "gets cell state", %{world: world} do
      assert !GameOfLife.Cell.alive?(world, 0, 0)
      assert GameOfLife.Cell.alive?(world, 1, 1)
    end
  end

  describe ".alive_in_neighborhood/3" do
    test "returns number of alive cells in neighborhood", %{world: world} do
      assert GameOfLife.Cell.alive_in_neighborhood(world, 0, 0) == 2
      assert GameOfLife.Cell.alive_in_neighborhood(world, 0, 1) == 1
      assert GameOfLife.Cell.alive_in_neighborhood(world, 1, 1) == 2
      assert GameOfLife.Cell.alive_in_neighborhood(world, 2, 2) == 2
    end
  end

  describe ".next_cell_state/3" do
    test "when the cell is alive and it has less than 2 live neighbours, it dies" do
      world = %{
        0 => %{ 0 => 1, 1 => 0, 2 => 0 },
        1 => %{ 0 => 0, 1 => 1, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.Cell.next_state(world, 1, 1) == 0
    end

    test "when the cell is alive and it has 2 live neighbours, it stays alive" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 0 },
        1 => %{ 0 => 0, 1 => 1, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.Cell.next_state(world, 1, 1) == 1
    end

    test "when the cell is alive and it has 3 live neighbours, it stays alive" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 1 },
        1 => %{ 0 => 0, 1 => 1, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.Cell.next_state(world, 1, 1) == 1
    end

    test "when the cell is alive and it has more than 3 live neighbours, it dies" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 1 },
        1 => %{ 0 => 1, 1 => 1, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.Cell.next_state(world, 1, 1) == 0
    end

    test "when the cell is dead and it has less than 3 live neighbours, it stays dead" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 0 },
        1 => %{ 0 => 0, 1 => 0, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.Cell.next_state(world, 1, 1) == 0
    end

    test "when the cell is dead and it has 3 live neighbours, it becomes alive" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 1 },
        1 => %{ 0 => 0, 1 => 0, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.Cell.next_state(world, 1, 1) == 1
    end

    test "when the cell is dead and it has more than 3 live neighbours, it stays dead" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 1 },
        1 => %{ 0 => 1, 1 => 0, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.Cell.next_state(world, 1, 1) == 0
    end
  end
end
