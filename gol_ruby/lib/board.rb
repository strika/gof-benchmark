require "cell"

class Board
  attr_reader :size

  def initialize(size)
    @size = size
    @board = build_board
  end

  def get(x, y)
    @board[y][x]
  end

  def to_s
    @board.map { |row| row.join(",") }.join("\n")
  end

  private

  def build_board
    Array.new(@size) do
      Array.new(@size) { Cell.new }
    end
  end
end
