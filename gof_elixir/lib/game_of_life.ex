defmodule GameOfLife do
  @moduledoc """
  Game Of Life implementation in Elixir.
  """

  @doc """
  Runs the experiment.
  """
  def run do
    {:ok, world} = GameOfLife.World.start_link(100)
    parse_board(world)

    save_board(world)
  end

  @doc """
  Updates the cell defined by the coordinates `x` and `y` state in the `world`.
  """
  def update_cell(world, world_state, x, y) do
    new_state = GameOfLife.Cell.next_state(world_state, x, y)
    GameOfLife.World.set(world, x, y, new_state)
  end


  @doc """
  It calculates the next state of all cells of the world and it updates the
  world.
  """
  def update_world(world) do
    world_state = GameOfLife.World.state(world)
    for x <- Map.keys(world_state),
        y <- Map.keys(world_state[x]) do
          update_cell(world, world_state, x, y)
        end
  end

  defp parse_board(world) do
    board = File.read!("board.csv")
    GameOfLife.Board.parse(board, world)
  end

  defp save_board(world) do
    board = GameOfLife.Board.generate(world)
    File.write("result.csv", board)
  end
end
