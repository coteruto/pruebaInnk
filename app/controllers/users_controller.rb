class UsersController < ApplicationController
	before_action :set_user, only: [:show,:edit,:update,:destroy,:edit_multi,:update_multi]

	def index
		@users = User.all
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

	def edit_multi
		@movies = Movie.all
	end

	def update_multi
		assigned_movie = false
		params[:movie].each do |movie_id|
			movie = Movie.find(movie_id)
			if movie
				if movie.update(user: @user)
					assigned_movie = true
				end
			end
		end
		if assigned_movie
			flash[:notice] = "Las películas se agregaron exitosamente"
		else
			flash[:alert] = "Ocurrió un error al intentar asignar las películas"
		end
		redirect_to users_path
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:name,:email)
		end
end
