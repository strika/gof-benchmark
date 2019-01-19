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
end
