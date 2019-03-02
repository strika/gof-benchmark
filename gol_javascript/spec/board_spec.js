describe("Board", function() {
  describe(".create", function() {
    it("returns a board", function() {
      var board = Board.create(3);

      expect(board).toEqual([
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0],
      ]);
    });
  });

  describe(".get", function() {
    it("returns a cell value", function() {
      var board = [
        [1, 0, 0],
        [0, 0, 0],
        [0, 1, 0],
      ];

      expect(Board.get(board, 0, 0)).toEqual(1);
      expect(Board.get(board, 1, 0)).toEqual(0);
      expect(Board.get(board, 1, 1)).toEqual(0);
      expect(Board.get(board, 1, 2)).toEqual(1);
    });
  });

  describe(".set", function() {
    it("sets a cell value", function() {
      var board = Board.create(3);

      Board.set(board, 0, 0, 1);
      Board.set(board, 1, 1, 1);
      Board.set(board, 1, 2, 1);

      expect(board).toEqual([
        [1, 0, 0],
        [0, 1, 0],
        [0, 1, 0]
      ]);
    });
  });

  describe(".aliveInNeighborhood", function() {
    it("returns the number of alive cells in the neighboorhood", function() {
      var board = [
        [1, 0, 0],
        [0, 1, 1],
        [0, 1, 0],
      ];

      expect(Board.aliveInNeighborhood(board, 0, 0)).toEqual(1);
      expect(Board.aliveInNeighborhood(board, 1, 0)).toEqual(3);
      expect(Board.aliveInNeighborhood(board, 1, 1)).toEqual(3);
      expect(Board.aliveInNeighborhood(board, 0, 2)).toEqual(2);
      expect(Board.aliveInNeighborhood(board, 2, 2)).toEqual(3);
    });
  });
});
