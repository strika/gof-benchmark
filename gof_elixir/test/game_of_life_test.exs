defmodule GameOfLifeTest do
  use ExUnit.Case, async: true

  describe ".next_cell_state/3" do
    test "when the cell is alive and it has less than 2 live neighbours, it dies" do
      world = %{
        0 => %{ 0 => 1, 1 => 0, 2 => 0 },
        1 => %{ 0 => 0, 1 => 1, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.next_cell_state(world, 1, 1) == 0
    end

    test "when the cell is alive and it has 2 live neighbours, it stays alive" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 0 },
        1 => %{ 0 => 0, 1 => 1, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.next_cell_state(world, 1, 1) == 1
    end

    test "when the cell is alive and it has 3 live neighbours, it stays alive" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 1 },
        1 => %{ 0 => 0, 1 => 1, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.next_cell_state(world, 1, 1) == 1
    end

    test "when the cell is alive and it has more than 3 live neighbours, it dies" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 1 },
        1 => %{ 0 => 1, 1 => 1, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.next_cell_state(world, 1, 1) == 0
    end

    test "when the cell is dead and it has less than 3 live neighbours, it stays dead" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 0 },
        1 => %{ 0 => 0, 1 => 0, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.next_cell_state(world, 1, 1) == 0
    end

    test "when the cell is dead and it has 3 live neighbours, it becomes alive" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 1 },
        1 => %{ 0 => 0, 1 => 0, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.next_cell_state(world, 1, 1) == 1
    end

    test "when the cell is dead and it has more than 3 live neighbours, it stays dead" do
      world = %{
        0 => %{ 0 => 1, 1 => 1, 2 => 1 },
        1 => %{ 0 => 1, 1 => 0, 2 => 0 },
        2 => %{ 0 => 0, 1 => 0, 2 => 0 }
      }

      assert GameOfLife.next_cell_state(world, 1, 1) == 0
    end
  end
end
