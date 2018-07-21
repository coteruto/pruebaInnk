class SeriesController < ApplicationController
	before_action :set_serie, except: [:index,:new,:create]

	def index
		@search = Serie.search(params[:q])
 		@series = @search.result
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

	def associate_user
		@users = User.all
	end

	private
		def set_serie
			@serie = Serie.find(params[:id])
		end

		def serie_params
			params.require(:serie).permit(:title,:genre,:price,:season,:user_id)
		end
end
