module Api
  module V1
    class GamesController < ApplicationController
      def index
        # renvois toutes les donnees de la db sous forme de json
        games = Game.all

        # render json: GamesRepresenter.new(games).as_json
        render json: games
      end

      def create
        game = Game.new(game_params)

        if game.save
          render json: game, status: :created
        else
          render json: game.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Game.find(params[:id]).destroy!

        head :no_content
      end

      private

      def game_params
        #on accepte uniquement les perametre défini en dessous pour le create
        params.require(:game).permit(:game_name, :description, :release)
      end
    end
  end
end