require "cell"

class Board
  def initialize(size)
    @board = Array.new(size) do
      Array.new(size) do
        Cell.new
      end
    end
  end

  def get(x, y)
    @board[y][x]
  end

  def to_s
    @board.map { |row| row.join(",") }.join("\n")
  end
end
