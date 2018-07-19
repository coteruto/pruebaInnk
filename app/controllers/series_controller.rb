class SeriesController < ApplicationController
	before_action :set_serie, only: [:show,:edit,:update,:destroy,:edit_user,:destroy_user]

	def index
		@series = Serie.all
	end

	def show
	end

	def new
		@serie = Serie.new
	end

	def create
		@serie = Serie.new(serie_params)
		if @serie.save
			flash[:notice] = "Serie agregada exitosamente"
			redirect_to @serie
		else 
			render :new
		end
	end

	def edit
	end

	def update
		if @serie.update(serie_params)
			flash[:notice] = "Serie editada exitosamente"
			redirect_to @serie
		else
			flash[:alert] = "Ocurrió un error al intentar editar la serie"
			render :show
		end
	end

	def destroy
		 if @serie.destroy
		 	flash[:notice] = "Serie eliminada"
		 else
		 	flash[:alert] = "Ocurrió un problema al intentar eliminar la serie"
		 end
		 redirect_to series_path
	end

	def edit_user
		@users = User.all
	end

	def destroy_user
		user = @movie.user
		user.movies.delete(@movie)
	end

	private
		def set_serie
			@serie = Serie.find(params[:id])
		end

		def serie_params
			params.require(:serie).permit(:title,:genre,:price,:season,:user_id)
		end
end
