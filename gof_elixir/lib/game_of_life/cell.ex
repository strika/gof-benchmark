defmodule GameOfLife.Cell do
  @doc """
  Get state of the cell defined by `x` and `y` in `world`.
  """
  def state(world, x, y) do
    Map.get(Map.get(world, x, %{}), y, 0)
  end

  @doc """
  It calculates the next state of the cell defined by the coordinates.
  """
  def next_state(world, x, y) do
    case alive_in_neighborhood(world, x, y) do
      3 -> 1
      2 -> if alive?(world, x, y) do 1 else 0 end
      _ -> 0
    end
  end

  @doc """
  Returns `true` if the cell defined by coordinates is alive.
  """
  def alive?(world, x, y) do
    state(world, x, y) == 1
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
          state(world, i, j)
        end
  end
end
