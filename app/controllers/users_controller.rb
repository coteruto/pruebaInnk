class UsersController < ApplicationController
	before_action :set_user, except: [:index,:new,:create]

	def index
		@search = User.search(params[:q])
 		@users = @search.result
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Usuario creado exitosamente"
			redirect_to @user
		else 
			render :new
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Usuario editado exitosamente"
			redirect_to @user
		else
			flash[:alert] = "Ocurrió un error al intentar editar el usuario"
			render :show
		end
	end

	def destroy
		 if @user.destroy
		 	flash[:notice] = "Usuario eliminado"
		 else
		 	flash[:alert] = "Ocurrió un problema al intentar eliminar el usuario"
		 end
		 redirect_to users_path
	end

	def add_movies_association
		@movies = Movie.get_available
	end

	def associate_movies
		assigned_movies = true
		params[:movie].each do |movie_id|
			movie = Movie.find(movie_id)
			if movie
				assigned_movies = false unless movie.update(user: @user)
			end
		end
		if assigned_movies
			flash[:notice] = "Las películas se agregaron exitosamente"
		else
			flash[:alert] = "No se pudieron agregar todas las películas seleccionadas"
		end
		redirect_to users_path
	end

	def add_series_association
		@series = Serie.get_available
	end

	def associate_series
		assigned_series = true
		params[:serie].each do |serie_id|
			serie = Serie.find(serie_id)
			if serie
				assigned_series = false unless serie.update(user: @user)
			end
		end
		if assigned_series
			flash[:notice] = "Las series se agregaron exitosamente"
		else
			flash[:alert] = "No se pudieron agregar todas las series seleccionadas"
		end
		redirect_to users_path
	end

	def dissociate_movie_user
		movie = Movie.find(params[:movie_id])
		@user.movies.delete(movie)
		redirect_to movies_path
	end

	def dissociate_serie_user
		serie = Serie.find(params[:serie_id])
		@user.series.delete(serie)
		redirect_to series_path
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:name,:email)
		end
end
