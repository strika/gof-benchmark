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
    var board;

    beforeEach(function() {
      board = [
        [1, 0, 0],
        [0, 0, 0],
        [0, 1, 0],
      ];
    });

    it("returns a cell value", function() {
      expect(Board.get(board, 0, 0)).toEqual(1);
      expect(Board.get(board, 1, 0)).toEqual(0);
      expect(Board.get(board, 1, 1)).toEqual(0);
      expect(Board.get(board, 1, 2)).toEqual(1);
    });

    it("returns 0 when a cell is out of bounds", function() {
      expect(Board.get(board, -1, 0)).toEqual(0);
      expect(Board.get(board, 0, -1)).toEqual(0);
      expect(Board.get(board, 3, 0)).toEqual(0);
      expect(Board.get(board, 0, 3)).toEqual(0);
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

  describe(".neighborhoodCoordinates", function() {
    it("returns coordinates of the neighborhood cells", function() {
      expect(Board.neighborhoodCoordinates(1, 1)).toEqual([
        [0, 0], [1, 0], [2, 0], [0, 1], [2, 1], [0, 2], [1, 2], [2, 2]
      ]);
    });
  });

  describe(".nextState", function() {
    it("returns next state state of board", function() {
      var board = [
        [0, 1, 0],
        [0, 1, 0],
        [0, 1, 0]
      ];

      expect(Board.nextState(board)).toEqual([
        [0, 0, 0],
        [1, 1, 1],
        [0, 0, 0]
      ]);
    });
  });
});
