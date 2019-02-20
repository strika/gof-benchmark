require "cell"

RSpec.describe Cell do
  describe "#alive?" do
    context "when cell is dead" do
      it "returns false" do
        cell = Cell.new
        expect(cell.alive?).to be_falsy
      end
    end
  end
end
