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
  Returns the current state of the world.
  """
  def state(world) do
    Agent.get(world, fn state -> state end)
  end

  @doc """
  Returns the number of cells in the world..
  """
  def cells_count(world) do
    world_state = state(world)
    map_size(world_state) * map_size(world_state[0])
  end
end
