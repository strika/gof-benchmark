defmodule GameOfLife do
  @moduledoc """
  Game Of Life implementation in Elixir.
  """

  @doc """
  Runs the experiment sequentially.
  """
  def run_sequentially do
    run(&update_world_sequentially/1)
  end

  @doc """
  Runs the experiment by updating every cell in a separate process.
  """
  def run_with_spawn do
    run(&update_world_with_spawn/1)
  end

  @doc """
  Runs the experiment by updating every column in a separate process.
  """
  def run_with_column_spawn do
    run(&update_world_with_column_spawn/1)
  end

  @doc """
  Runs the experiment.
  """
  def run(update_function) do
    {:ok, world} = GameOfLife.World.start_link(100)
    parse_board(world)

    start = Time.utc_now

    for _ <- 1..1000 do
      update_function.(world)
    end

    finish = Time.utc_now

    IO.puts "Finished in #{Time.diff(finish, start, :millisecond)}"

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
  world sequentially..
  """
  def update_world_sequentially(world) do
    world_state = GameOfLife.World.state(world)
    for x <- Map.keys(world_state),
        y <- Map.keys(world_state[x]) do
          update_cell(world, world_state, x, y)
        end
  end

  @doc """
  It calculates the next state of all cells of the world and it updates the
  world by using a process for every cell.
  """
  def update_world_with_spawn(world) do
    world_state = GameOfLife.World.state(world)
    cells_count = GameOfLife.World.cells_count(world)
    parent = self()

    for x <- Map.keys(world_state),
        y <- Map.keys(world_state[x]) do
          spawn fn ->
            send(parent, {x, y, GameOfLife.Cell.next_state(world_state, x, y)})
          end
        end

    for _ <- 1..cells_count do
      receive do
        {x, y, state} -> GameOfLife.World.set(world, x, y, state)
      end
    end
  end

  @doc """
  It calculates the next state of all cells of the world and it updates the
  world by using a process for every column.
  """
  def update_world_with_column_spawn(world) do
    world_state = GameOfLife.World.state(world)
    columns_count = map_size(world_state)
    parent = self()

    for x <- Map.keys(world_state) do
        spawn fn ->
          for y <- Map.keys(world_state[x]) do
            cell_state = GameOfLife.Cell.next_state(world_state, x, y)
            GameOfLife.World.set(world, x, y, cell_state)
          end

          send(parent, "done")
        end
      end

    for _ <- 1..columns_count do
      receive do
        "done" ->
      end
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
