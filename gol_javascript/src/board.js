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
    if (_outOfBounds(board, x, y)) {
      return 0;
    }

    return board[y][x];
  }

  function set(board, x, y, value) {
    board[y][x] = value;

    return board;
  }

  function aliveInNeighborhood(board, x, y) {
    var neighborhood = neighborhoodCoordinates(x, y).map(coordinates =>
      get(board, coordinates[0], coordinates[1])
    );

    return neighborhood.filter(cell => cell === 1).length;
  }

  function neighborhoodCoordinates(x, y) {
    var coordinates = [];

    for (var i = -1; i < 2; i++) {
      for (var j = -1; j < 2; j++) {
        if (i != 0 || j != 0) {
          coordinates.push([x + j, y + i]);
        }
      }
    }

    return coordinates;
  }

  function nextState(board) {
    return [];
  }

  function _outOfBounds(board, x, y) {
    return x < 0 || y < 0 || y >= board.length || x >= board[y].length;
  }

  return {
    create: create,
    get: get,
    set: set,
    aliveInNeighborhood: aliveInNeighborhood,
    neighborhoodCoordinates: neighborhoodCoordinates,
    nextState: nextState
  };
}());
