class LeaderboardController < ApplicationController

	def index
		@genre = Genre.find_by(id: params[:id])
		@genrescs = Genrescore.where(genre_id: params[:id]).order("score DESC")
	end
	def show
		@subgenre = Subgenre.find_by(id: params[:id])
		@subgenrescs = Subgenrescore.where(subgenre_id: params[:id]).order("score DESC")
	end

	def chose
	end

end
