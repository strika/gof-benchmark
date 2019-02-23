require "benchmark"
require "board"

class GameOfLife
  def run
    board = parse_board

    time = Benchmark.realtime do
      1000.times { board.next_state }
    end

    puts "Completed in #{time * 1000}ms"

    File.write("result.csv", board)
  end

  def parse_board
    board = nil
    board_file = File.open("board.csv")

    board_file.each_with_index do |line, y|
      row = line.chomp.split(",")
      board ||= Board.new(row.length)

      row.each_with_index do |cell_state, x|
        board.get(x, y).revive if cell_state == "1"
      end
    end

    board
  end
end
