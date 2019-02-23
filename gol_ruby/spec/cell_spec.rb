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

  describe "#to_s" do
    context "when cell is dead" do
      it "returns '0'" do
        expect(Cell.new.to_s).to eq("0")
      end
    end

    context "when cell is alive" do
      it "returns '1'" do
        expect(Cell.new(:alive => true).to_s).to eq("1")
      end
    end
  end

  describe "#next_state" do
    context "when cell is alive" do
      before do
        @cell = Cell.new(:alive => true)
      end

      context "when the cell has fewer than 2 alive neighbours" do
        it "dies" do
          @cell.next_state(1)
          expect(@cell.alive?).to be_falsy
        end
      end

      context "when the cell has 2 alive neighbours" do
        it "stays alive" do
          @cell.next_state(2)
          expect(@cell.alive?).to be_truthy
        end
      end

      context "when the cell has 3 alive neighbours" do
        it "stays alive" do
          @cell.next_state(3)
          expect(@cell.alive?).to be_truthy
        end
      end

      context "when the cell has more than 3 alive neighbours" do
        it "dies" do
          @cell.next_state(4)
          expect(@cell.alive?).to be_falsy
        end
      end
    end

    context "when cell is dead" do
      before do
        @cell = Cell.new
      end

      context "when the cell has less than 3 alive neighbours" do
        it "stays dead" do
          @cell.next_state(2)
          expect(@cell.alive?).to be_falsy
        end
      end

      context "when the cell has 3 alive neighbours" do
        it "is revived" do
          @cell.next_state(3)
          expect(@cell.alive?).to be_truthy
        end
      end

      context "when the cell has more than 3 alive neighbours" do
        it "stays dead" do
          @cell.next_state(4)
          expect(@cell.alive?).to be_falsy
        end
      end
    end
  end
end
