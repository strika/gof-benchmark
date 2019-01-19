defmodule GameOfLife.World do
  @doc """
  Creates a world of given size where all cells are dead.
  """
  def create(size) do
    row = for k <- 0..(size - 1), into: %{}, do: {k, 0}
    for k <- 0..(size - 1), into: %{}, do: {k, row}
  end
end
