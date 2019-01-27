defmodule GameOfLife.BoardTest do
  use ExUnit.Case, async: true

  describe ".parse/2" do
    test "parses the board into world" do
      {:ok, world} = GameOfLife.World.start_link(3)
      board = "0,1,0\n1,0,1\n0,1,0"

      GameOfLife.Board.parse_board(board, world)

      assert GameOfLife.World.state(world) == %{
        0 => %{ 0 => 0, 1 => 1, 2 => 0 },
        1 => %{ 0 => 1, 1 => 0, 2 => 1 },
        2 => %{ 0 => 0, 1 => 1, 2 => 0 }
      }
    end
  end
end
