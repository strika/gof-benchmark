defmodule GameOfLife.Board do
  @doc """
  Parses the board into the world.
  """
  def parse_board(board, world) do
    lines = String.split(board)
    values = Enum.map(lines, fn line -> String.split(line, ",") end)
    board_size = length(values)

    for x <- 0..(board_size - 1),
        y <- 0..(board_size - 1) do
          {:ok, row} = Enum.fetch(values, x)
          {:ok, string_value} = Enum.fetch(row, y)
          {value, _} = Integer.parse(string_value)
          GameOfLife.World.set(world, x, y, value)
        end
  end

  @doc """
  Generates a string that represents the world state.
  """
  def generate(world) do
    world
    |> GameOfLife.World.state
    |> Enum.map(fn {_, row} -> Map.values(row) end)
    |> Enum.map(fn row -> Enum.join(row, ",") end)
    |> Enum.join("\n")
  end
end
