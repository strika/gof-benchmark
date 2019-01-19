defmodule GameOfLife.World do
  @doc """
  Creates a world of given size where all cells are dead.
  """
  def create(size) do
    for _ <- 1..size do
      for _ <- 1..size, do: 0
    end
  end
end
