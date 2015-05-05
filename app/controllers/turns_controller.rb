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
      @turn.cell = @cell
      @turn.save

      render json: {
        cellValue: @cell.value
      }, status: :created
    else
      render_error
    end
  end

  private

  def render_error
    render json: {
      error: 'invalid move'
    }, status: :internal_server_error
  end
end
