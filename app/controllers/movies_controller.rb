class MoviesController < ApplicationController
	def index
		@movies = Movie.released
	end

	def show
		@movies = Movie.find(params[:id])
	end

	def edit
		@movies = Movie.find(params[:id])
	end

	def update
		 @movie = Movie.find(params[:id])
  		if @movie.update(movie_param)
   			 redirect_to @movie, notice: "Movie successfully updated!"
  		else
    		render :edit
  		end
	end
	
	def create
  		@movie = Movie.new(movie_param)
  		if @movie.save
    		redirect_to @movie, notice: "Movie successfully created!"
  		else
   	 		render :new
  		end
	end

	def new
		@movie = Movie.new 
	end

	def destroy
		@movie = Movie.find(params[:id])
  		@movie.destroy
  		redirect_to movies_url, alert: "Movie successfully deleted!"
	end
	

	private

	def movie_param
		params.require(:movie).permit(:title, :rating, :total_gross, :release_on)
	end
	
	
end
