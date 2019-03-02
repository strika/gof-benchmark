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
});
