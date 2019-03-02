var Cell = (function() {
  function nextState(state, aliveInNeighborhood) {
    if (aliveInNeighborhood === 3 || (state === 1 && aliveInNeighborhood === 2)) {
      return 1;
    } else {
      return 0;
    }
  }

  return {
    nextState: nextState
  };
}());
