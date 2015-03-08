class AuthorController < ApplicationController
	def index
		@authors = Author.all

		render json: @authors
	end

	def create
		#author_params = JSON.parse(params[:author])

		#author = Author.create(author_params)

		author = Author.create(author_params)
		
		if author.valid?
			render :nothing => true, :status => :created
		else
			render :nothing => true, :status => :error
		end
	end
	
	def destroy
		author = Author.find(params[:id])
		author.delete

  		render :nothing => true, :status => :ok
	end
	
	private
	def author_params
		params.require(:author).permit(:name)
	end
end
