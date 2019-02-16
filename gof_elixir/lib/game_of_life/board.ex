defmodule GameOfLife.Board do
  @doc """
  Parses the board into the world.
  """
  def parse(board, world) do
    lines = String.split(board)
    values = Enum.map(lines, fn line -> String.split(line, ",") end)
    board_size = length(values)

    for x <- 0..(board_size - 1),
        y <- 0..(board_size - 1) do
          {:ok, row} = Enum.fetch(values, y)
          {:ok, string_value} = Enum.fetch(row, x)
          {value, _} = Integer.parse(string_value)
          GameOfLife.World.set(world, x, y, value)
        end
  end

  @doc """
  Generates a string that represents the world state.
  """
  def generate(world) do
    world_state = GameOfLife.World.state(world)
    world_size = map_size(world_state)

    rows = for y <- 0..(world_size - 1) do
      0..(world_size - 1)
      |> Enum.map(fn x -> GameOfLife.Cell.state(world_state, x, y) end)
      |> Enum.join(",")
    end

    Enum.join(rows, "\n")
  end
end
