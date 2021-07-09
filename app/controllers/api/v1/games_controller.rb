module Api
  module V1
    class GamesController < ApplicationController

      def index
        # renvois toutes les donnees de la db sous forme de json
        games = Game.all
        
        render json: games
      end #EO index

      def create
        platforms = params[:platforms]
        themes = params[:themes]
        genres = params[:genre]

        game = Game.new(game_params)

        platforms.each do |platform|
          game.platforms << Platform.find_by_id(platform)
        end

        themes.each do |theme|
          game.themes << Theme.find_by_id(theme)
        end

        genres.each do |genre|
          game.genres << Genre.find_by_id(genre)
        end

        if game.save
          render json: game, status: :created
        else
          render json: game.errors, status: :unprocessable_entity
        end #EO if game.save
      end #EO create

      def destroy
        Game.find(params[:id]).destroy!

        head :no_content
      end #EO destroy

      private

      def game_params
        #on accepte uniquement les perametre défini en dessous pour le create
        params.require(:game).permit(:game_name, :description, :release, :editor_id, :devloper_id, :platforms)
      end
    end
  end
end