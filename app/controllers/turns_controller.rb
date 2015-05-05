class TurnsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @cell = @game.board.cells.find_by_board_position(params[:board_position])
    @player = @game.players.find_by_name(params[:player_name][:name])
    @turn = Turn.new(
      game_id: @game.id,
      player_id: @player.id
    )

    if @cell.value.nil? && !@game.finished
      @cell.value = params[:value]
      @cell.save
    end

    @turn.cell = @cell
    @turn.save

    render json: {
      cellValue: @cell.value
    }, status: :created
  end
end
