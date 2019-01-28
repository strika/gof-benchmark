defmodule GameOfLife.BoardTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, world} = GameOfLife.World.start_link(3)
    %{world: world}
  end

  describe ".parse/2" do
    test "parses the board into world", %{world: world} do
      board = "0,1,0\n1,0,1\n0,1,0"

      GameOfLife.Board.parse(board, world)

      assert GameOfLife.World.state(world) == %{
        0 => %{ 0 => 0, 1 => 1, 2 => 0 },
        1 => %{ 0 => 1, 1 => 0, 2 => 1 },
        2 => %{ 0 => 0, 1 => 1, 2 => 0 }
      }
    end
  end

  describe ".generate/1" do
    test "generates string from worlds state", %{world: world} do
      GameOfLife.World.set(world, 1, 0, 1)
      GameOfLife.World.set(world, 1, 1, 1)
      GameOfLife.World.set(world, 1, 2, 1)

      assert GameOfLife.Board.generate(world) == "0,1,0\n0,1,0\n0,1,0"
    end
  end
end
