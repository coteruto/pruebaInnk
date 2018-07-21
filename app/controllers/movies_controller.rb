class MoviesController < ApplicationController
	before_action :set_movie, except: [:index,:new,:create]

	def index
		@search = Movie.search(params[:q])
 		@movies = @search.result
	end

	def show
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			flash[:notice] = "Película agregada exitosamente"
			redirect_to @movie
		else 
			render :new
		end
	end

	def edit
	end

	def update
		if @movie.update(movie_params)
			flash[:notice] = "Película editada exitosamente"
			redirect_to @movie
		else
			flash[:alert] = "Ocurrió un error al intentar editar la película"
			render :show
		end
	end

	def destroy
		 if @movie.destroy
		 	flash[:notice] = "Película eliminada"
		 else
		 	flash[:alert] = "Ocurrió un problema al intentar eliminar la película"
		 end
		 redirect_to movies_path
	end

	def associate_user
		@users = User.all
	end

	private
		def set_movie
			@movie = Movie.find(params[:id])
		end

		def movie_params
			params.require(:movie).permit(:title,:genre,:price,:duration,:user_id)
		end
end
