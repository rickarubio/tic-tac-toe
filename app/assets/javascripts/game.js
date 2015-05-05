Game = {};

(function() {
  var gameBoardCellClass = '.game-board__cell';
  var Player = function(name, symbol) {
    this.name = name;
    this.symbol = symbol;
  };
  var player1 = new Player();
  var player2 = new Player();
  var turn = 1;

  var Cell = function(cellElement) {
    this.boardPosition = $(cellElement).data('board-position');
    this.cellElement = $(cellElement);
  };

  Game.gameId = function() {
    return $('[data-game-id]').data('game-id');
  };

  Game.currentPlayer = function() {
    if (turn % 2 === 1) {
      return player1;
    } else {
      return player2;
    }
  };

  Game.turn = function(cell, value) {
    var create_cell_url = '/games/' + Game.gameId() + '/turns';
    var data = {
      game_id: Game.gameId(),
      player_name: Game.currentPlayer(),
      board_position: cell.boardPosition,
      value: Game.currentPlayer().symbol
    };

    $.ajax({
      type: 'POST',
      url: create_cell_url,
      data: data,
      success: function(data) {
        $(cell.cellElement).text(data.cellValue);
      },
      error: function(data) {
      }
    });

    turn = turn + 1;
  };

  Game.listenForClicks = function() {
    $(gameBoardCellClass).on('click', function() {
      var cellElement = this;
      var cell = new Cell(cellElement);

      player1.name = $('[data-player1-name]').data('player1-name');
      player1.symbol = "X";
      player2.name = $('[data-player2-name]').data('player2-name');
      player2.symbol = "O";

      Game.turn(cell);
    });
  };
})();

$('[data-role="games#show"]').ready(function() {
  Game.listenForClicks();
});
