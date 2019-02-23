require "board"

RSpec.describe Board do
  describe ".neighborhood_coordinates" do
    it "returns coordinate of cells from neighborhood" do
      expect(Board.neighborhood_coordinates(1, 1)).to match_array([
        [0, 0], [1, 0], [2, 0], [0, 1], [2, 1], [0, 2], [1, 2], [2, 2]
      ])
    end
  end

  describe "#initialize" do
    it "creates a board with dead cells" do
      board = Board.new(4)

      cell = board.get(0, 0)

      expect(cell).to be_an_instance_of(Cell)
      expect(cell.alive?).to be_falsy
    end
  end

  describe "#get" do
    context "when coordinates are out of bounds" do
      before do
        @board = Board.new(1)
        @board.get(0, 0).revive
      end

      context "when x is lower than 0" do
        it "returns a dead cell" do
          expect(@board.get(-1, 0).alive?).to be_falsy
        end
      end

      context "when y is lower than 0" do
        it "returns a dead cell" do
          expect(@board.get(0, -1).alive?).to be_falsy
        end
      end

      context "when x is higher than or equal to size" do
        it "returns a dead cell" do
          expect(@board.get(1, 0).alive?).to be_falsy
        end
      end

      context "when y is higher than or equal to size" do
        it "returns a dead cell" do
          expect(@board.get(0, 1).alive?).to be_falsy
        end
      end
    end
  end

  describe "#to_s" do
    it "returns String representation of the board" do
      board = Board.new(2)

      board.get(0, 0).revive
      board.get(1, 0).revive

      expect(board.to_s).to eq("1,1\n0,0")
    end
  end

  describe "#alive_in_neighbourhood" do
    # Board:
    #
    # 1 1 1
    # 1 0 0
    # 0 0 1

    before do
      @board = Board.new(3)
      @board.get(0, 0).revive
      @board.get(1, 0).revive
      @board.get(2, 0).revive
      @board.get(0, 1).revive
      @board.get(2, 2).revive
    end

    it "returns the number of alive cells in neighbourhood" do
      expect(@board.alive_in_neighbourhood(0, 0)).to eq(2)
      expect(@board.alive_in_neighbourhood(1, 0)).to eq(3)
      expect(@board.alive_in_neighbourhood(2, 0)).to eq(1)
      expect(@board.alive_in_neighbourhood(0, 1)).to eq(2)
      expect(@board.alive_in_neighbourhood(2, 2)).to eq(0)
    end
  end
end
