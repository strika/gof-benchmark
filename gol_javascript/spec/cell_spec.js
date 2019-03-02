describe("Cell", function() {
  describe(".nextState", function() {
    describe("when cell is alive", function() {
      describe("when cell has fewer than 2 live neighbors", function() {
        it("returns 0", function() {
          expect(Cell.nextState(1, 1)).toEqual(0);
        });
      });

      describe("when cell has 2 live neighbors", function() {
        it("returns 1", function() {
          expect(Cell.nextState(1, 2)).toEqual(1);
        });
      });

      describe("when cell has 3 live neighbors", function () {
        it("returns 1", function() {
          expect(Cell.nextState(1, 3)).toEqual(1);
        });
      });

      describe("when cell has more than 3 live neighbors", function() {
        it("returns 0", function() {
          expect(Cell.nextState(1, 4)).toEqual(0);
        });
      });
    });

    describe("when cell is dead", function() {
      describe("when cell has fewer than 3 live neighbors", function() {
        it("returns 0", function() {
          expect(Cell.nextState(0, 2)).toEqual(0);
        });
      });

      describe("when cell has 3 live neighbors", function() {
        it("returns 1", function() {
          expect(Cell.nextState(0, 3)).toEqual(1);
        });
      });

      describe("when cell has more than 3 live neighbors", function() {
        it("returns 0", function() {
          expect(Cell.nextState(0, 4)).toEqual(0);
        });
      });
    });
  });
});
