GameBoard = {};

(function() {
  var gameBoardCellClass = '.game-board__cell';
  var turn = 1;

  GameBoard.listenForClicks = function() {
    $(gameBoardCellClass).on('click', function() {
      var cell = this;

      if (turn % 2 !== 0) {
        $(cell).text('X');
      } else {
        $(cell).text('O');
      }

      turn = turn + 1;
    });
  };
})();

$('[data-role="games#show"]').ready(function() {
  GameBoard.listenForClicks();
});
