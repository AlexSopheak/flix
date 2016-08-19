class API::MoviesController < ApplicationController
	def index
		movies = Movie.all			
		render json: movies
	end
end
