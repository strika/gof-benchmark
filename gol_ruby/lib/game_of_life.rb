require "board"

class GameOfLife
  def run
    board = parse_board

    puts board
  end

  def parse_board
    board = nil
    board_file = File.open("board.csv")

    board_file.each_with_index do |line, y|
      row = line.split(",")
      board ||= Board.new(row.length)

      row.each_with_index do |cell_state, x|
        board.get(x, y).revive if cell_state == "1"
      end
    end

    board
  end
end
