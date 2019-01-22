defmodule GameOfLife.World do
  use Agent

  @doc """
  Creates a new world.
  """
  def start_link(size) do
    Agent.start_link(fn -> create(size) end)
  end

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
    Agent.update(world, fn world -> put_in(world[x][y], state) end)
  end

  @doc """
  Get state of cell in the coordinates.
  """
  def get(world, x, y) do
    Agent.get(world, fn world -> Map.get(Map.get(world, x, %{}), y, 0) end)
  end

  @doc """
  Returns `true` if the cell defined by coordinates is alive.
  """
  def alive?(world, x, y) do
    get(world, x, y) == 1
  end

  @doc """
  Returns number of alive cells in neigborhood defined by coordinates.
  """
  def alive_in_neighborhood(world, x, y) do
    List.foldl(neighborhood(world, x, y), 0, &(&1 + &2))
  end

  defp neighborhood(world, x, y) do
    for i <- (x - 1)..(x + 1),
        j <- (y - 1)..(x + 1),
        i != x || j != y do
          get(world, i, j)
        end
  end
end
