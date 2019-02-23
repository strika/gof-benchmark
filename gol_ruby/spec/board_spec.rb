require "board"

RSpec.describe Board do
  describe "#initialize" do
    it "creates a board with dead cells" do
      board = Board.new(4)

      cell = board.get(0, 0)

      expect(cell).to be_an_instance_of(Cell)
      expect(cell.alive?).to be_falsy
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
end
