var Board = (function() {
  function create(size) {
    var row = new Array(size),
        board = new Array(size);

    row.fill(0);
    board.fill(row);

    return board;
  }

  function get(board, x, y) {
    return board[y][x];
  }

  return {
    create: create,
    get: get
  };
}());
