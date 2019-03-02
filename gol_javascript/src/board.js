var Board = (function() {
  function create(size) {
    var board = [],
        row = null;

    for (var i = 0; i < size; i++) {
      row = new Array(size);
      row.fill(0);
      board.push(row);
    }

    return board;
  }

  function get(board, x, y) {
    return board[y][x];
  }

  function set(board, x, y, value) {
    board[y][x] = value;

    return board;
  }

  function aliveInNeighborhood(board, x, y) {
    return 0;
  }

  return {
    create: create,
    get: get,
    set: set,
    aliveInNeighborhood: aliveInNeighborhood
  };
}());
