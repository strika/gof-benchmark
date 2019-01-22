defmodule GameOfLife.Cell do
  use GenServer

  ## Client API

  @doc """
  Starts the cell.
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, %{}}
  end
end
