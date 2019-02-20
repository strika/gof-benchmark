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
end
