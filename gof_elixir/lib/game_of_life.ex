defmodule GameOfLife do
  @moduledoc """
  Game Of Life implementation in Elixir.
  """

  @doc """
  It calculates the next state of the cell defined by the coordinates.
  """
  def next_cell_state(world, x, y) do
    case GameOfLife.World.alive_in_neighborhood(world, x, y) do
      3 -> 1
      2 -> if GameOfLife.World.alive?(world, x, y) do 1 else 0 end
      _ -> 0
    end
  end
end
