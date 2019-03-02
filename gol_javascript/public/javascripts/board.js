var Board = (function() {
  function create(size) {
    var row = new Array(size),
        board = new Array(size);

    row.fill(0);
    board.fill(row);

    return board;
  }

  return {
    create: create
  };
}());
