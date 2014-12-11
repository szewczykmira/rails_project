class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  respond_to :html

  def index
    @games = Game.all
    respond_with(@games)
  end

  def show
    respond_with(@game)
  end

  def new
    @game = Game.new
    respond_with(@game)
  end

  def edit
  end

  def create
    @game = GameForm.new(game_params)
    respond_to do |format|
      if game_service.call(@game)
        format.html { redirect_to new_game_path }
      else
        format.html { render new_game_path }
      end
    end
  end

  def update
    @game.update(game_params)
    respond_with(@game)
  end

  def destroy
    @game.destroy
    respond_with(@game)
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :dscr, :release_date, :category_id)
    end

    def game_service
      @game_service ||= GameService.new
    end
end
