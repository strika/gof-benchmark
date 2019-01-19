defmodule GameOfLife.World do
  @doc """
  Creates a world of given `size` where all cells are dead.
  """
  def create(size) do
    row = for k <- 0..(size - 1), into: %{}, do: {k, 0}
    for k <- 0..(size - 1), into: %{}, do: {k, row}
  end

  @doc """
  Sets the given `state` to the cooordinates in `world`.
  """
  def set(world, x, y, state) do
    put_in(world[x][y], state)
  end

  @doc """
  Get state of cell in the coordinates.
  """
  def get(world, x, y) do
    world[x][y]
  end
end
