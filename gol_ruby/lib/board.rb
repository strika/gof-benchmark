require "cell"

class Board
  attr_reader :size

  def self.neighborhood_coordinates(x, y)
    neighborhood_with_center = (-1..1).flat_map do |delta_x|
      (-1..1).map do |delta_y|
        [x - delta_x, y - delta_y]
      end
    end

    neighborhood_with_center.delete([x, y])
    neighborhood_with_center
  end

  def initialize(size)
    @size = size
    @board = build_board
  end

  def get(x, y)
    return Cell.new if out_of_bounds?(x, y)

    @board[y][x]
  end

  def alive_in_neighbourhood(x, y)
    self.class.neighborhood_coordinates(x, y)
        .map { |coordinates| get(*coordinates) }
        .select(&:alive?)
        .count
  end

  def next_state
    cells = all_coordinates.map do |x, y|
      [get(x, y), alive_in_neighbourhood(x, y)]
    end

    cells.map do |cell, alive_in_neighbourhood|
      cell.next_state(alive_in_neighbourhood)
    end
  end

  def all_coordinates
    (0...@size).flat_map do |x|
      (0...@size).map { |y| [x, y] }
    end
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

  def out_of_bounds?(x, y)
    x.negative? || y.negative? || x >= size || y >= size
  end
end
