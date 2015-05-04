class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @player1 = Player.new(game_params[:player1])
    @player2 = Player.new(game_params[:player2])

    if @game.save && @player1.save && @player2.save
      @game.players.push(@player1, @player2)
      redirect_to @game
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    @player1 = @game.players.first
    @player2 = @game.players.last
  end

  private

  def game_params
    player1 = params.require(:player1).permit(:name)
    player2 = params.require(:player2).permit(:name)
    { player1: player1, player2: player2 }
  end
end
