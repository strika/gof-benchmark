require "cell"

RSpec.describe Cell do
  describe "#alive?" do
    context "when cell is dead" do
      it "returns false" do
        cell = Cell.new
        expect(cell.alive?).to be_falsy
      end
    end

    context "when cell is alive" do
      it "returns true" do
        cell = Cell.new(:alive => true)
        expect(cell.alive?).to be_truthy
      end
    end
  end

  describe "#kill" do
    it "makes the cell dead" do
      cell = Cell.new(:alive => true)

      cell.kill

      expect(cell.alive?).to be_falsy
    end
  end

  describe "#revive" do
    it "makes the cell alive" do
      cell = Cell.new

      cell.revive

      expect(cell.alive?).to be_truthy
    end
  end
end
