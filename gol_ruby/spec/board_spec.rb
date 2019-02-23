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
end
